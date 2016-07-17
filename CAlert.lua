
CAlert_SavedChanges = nil
CAlert_Dbid = {}

function CAlert_OnLoad(self)
    self:SetClampedToScreen(true)
	self:SetScript("OnEvent", CAlert_OnEvent)
	self:RegisterEvent("VARIABLES_LOADED")
    self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	self:RegisterEvent("PLAYER_LOGIN")
end

function DrawAbilitiesMenu()

	local frame = CreateFrame("Frame", nil, AbilitiesScrollFrame)
	frame:SetSize(200,300)
	frame:SetPoint("TOPLEFT")

	local titleOffsetX, titleOffsetY = 15, 0
	local cbOffsetX, cbOffsetY = 5, -35
	local textureOffsetX, textureOffsetY = 30, -25
	local nsOffsetX, nsOffsetY = 76, -40

    for _, class in pairs(gameclass) do

	    dbclass = GetClass(class)
		local classTitleLine = frame:CreateFontString()
		classTitleLine:SetSize(130, 15)
	    classTitleLine:SetFont("Interface\\AddOns\\CAlert\\Fonts\\".._G.CAlert_SavedChanges["CurrentFont"]..".TTF", 14, "THICKOUTLINE")
		classTitleLine:SetTextColor(classcolor[class]["r"], classcolor[class]["g"], classcolor[class]["b"], 1)
		classTitleLine:SetJustifyH("LEFT")
	    classTitleLine:SetPoint("TOPLEFT", titleOffsetX, titleOffsetY)
        classTitleLine:SetText(class)

		for id in pairs(dbclass) do

            local checkBox = CreateFrame("CheckButton", "spellCheckBox"..id, frame, "UICheckButtonTemplate")
	        checkBox:SetSize(20,20)
	        checkBox:SetPoint("TOPLEFT", cbOffsetX, cbOffsetY)
			checkBox.id = id
			checkBox:SetScript("OnClick", function(self)
			    if self:GetChecked() then
				    _G.CAlert_Dbid[self.id] = {link = GetSpellLink(self.id), sType = dbspell[self.id]["spellType"]}
		            _G.CAlert_SavedChanges["cbid"][self.id] = 1
				else
				    _G.CAlert_Dbid[self.id] = nil
		            _G.CAlert_SavedChanges["cbid"][self.id] = nil
				end
			end)

            local texture = frame:CreateTexture()
	        texture:SetSize(40,40)
	        texture:SetTexture(dbclass[id]["iconPath"])
	        texture:SetPoint("TOPLEFT", textureOffsetX, textureOffsetY)

			local button = CreateFrame("Button", nil, frame)
			button:SetSize(20,20)
			button:SetNormalTexture("Interface\\BUTTONS\\UI-Panel-BiggerButton-Up")
			button:SetHighlightTexture("Interface\\BUTTONS\\UI-Panel-BiggerButton-Down")
			button:SetPoint("BOTTOMRIGHT", texture, 5, -5)
			button.id = id
			button:SetScript("OnEnter", function(self)
			    local ttlink = GetSpellLink(self.id)
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:SetHyperlink(ttlink)
				GameTooltip:Show()
			end)
			button:SetScript("OnLeave", function(self)
			    GameTooltip:Hide()
			end)

	        local nameString = frame:CreateFontString()
	        nameString:SetSize(200, 15)
	        nameString:SetFont("Interface\\AddOns\\CAlert\\Fonts\\".._G.CAlert_SavedChanges["CurrentFont"]..".TTF", 14, "THICKOUTLINE")
			nameString:SetTextColor(0.9, 0.7, 0.1, 1)
			nameString:SetJustifyV("CENTER")
	        nameString:SetPoint("TOPLEFT", nsOffsetX, nsOffsetY)
            nameString:SetText(dbclass[id]["name"])

			cbOffsetY = cbOffsetY - 50
			textureOffsetY = textureOffsetY - 50
			nsOffsetY = nsOffsetY - 50
			titleOffsetY = cbOffsetY - 10

		end

		cbOffsetY = titleOffsetY - 35
		textureOffsetY = titleOffsetY - 25
		nsOffsetY = titleOffsetY - 37

	end

	AbilitiesScrollFrame:SetScrollChild(frame)

end

CAlert_Fonts = { "MORPHEUS", "ARIALN", "FRIZQT", "NIM", "SKURRI" }

function DrawFontsFrame()

    local fontFrame = CreateFrame("Frame", "FontsFrame", CAlert)
	fontFrame:SetSize(470, 190)
	fontFrame:SetPoint("TOPLEFT", 16, -50)
	fontFrame:Hide()

    local fontString = fontFrame:CreateFontString()
	fontString:SetSize(130, 15)
	fontString:SetFont("Interface\\AddOns\\CAlert\\Fonts\\".._G.CAlert_SavedChanges["CurrentFont"]..".TTF", 14, "THICKOUTLINE")
	fontString:SetJustifyH("LEFT")
	fontString:SetTextColor(0.9, 0.7, 0.1, 1)
	fontString:SetPoint("TOPLEFT", 15, 0)
	fontString:SetText("Fonts")

	local groupScrollFrame = CreateFrame("ScrollFrame", nil, fontFrame)
	groupScrollFrame:SetSize(170, 160)
	groupScrollFrame:SetPoint("TOPLEFT", 5, -20)
	groupScrollFrame:EnableMouseWheel(true)
	groupScrollFrame:SetScript("OnMouseWheel", function(self, delta)
	    local scrollbar = _G["GroupFontsScrollBar"]
		if delta == 1 then
		    scrollbar:SetValue(scrollbar:GetValue() - scrollbar:GetValueStep())
		else
		    scrollbar:SetValue(scrollbar:GetValue() + scrollbar:GetValueStep())
		end
	end)

	local fontsCount = #CAlert_Fonts
	local groupScrollBar = CreateFrame("Slider", "GroupFontsScrollBar", groupScrollFrame, "UIPanelScrollBarTemplate")
	local step = 5
	local minv, maxv = 1,  (5 * step) + 1
	groupScrollBar:SetPoint("TOPLEFT", 164, -16)
	groupScrollBar:SetFrameStrata("HIGH")
	groupScrollBar:SetSize(35, 130)
	groupScrollBar:SetMinMaxValues(minv, maxv)
	groupScrollBar.scrollStep = 5
	groupScrollBar:SetValue(1)
	groupScrollBar:SetValueStep(5)

	local groupFrame = CreateFrame("Frame", nil, groupScrollFrame)
	groupFrame:SetSize(170, 60 * fontsCount)
	groupFrame:SetPoint("TOPLEFT")

	local offsetX, offsetY = 5, -5
	for _, font in pairs(_G.CAlert_Fonts) do
	    local button = CreateFrame("Button", "fontButton"..font, groupFrame)
		button.font = font
		button:SetSize(160, 50)
		button:SetPoint("TOPLEFT", offsetX, offsetY)
		offsetY = offsetY - 35

		local fstring = button:CreateFontString(nil, nil, "GameFontNormal")
		fstring:SetSize(130, 40)
		fstring:SetPoint("TOP")
		fstring:SetText(font)
		button:SetFontString(fstring)

		local texture = button:CreateTexture()
		texture:SetTexture("Interface\\BUTTONS\\UI-DialogBox-Button-Disabled")
		texture:SetAlpha(0.5)
		texture:SetAllPoints()
		button:SetHighlightTexture(texture)

		button:SetScript("OnClick", function(self)
			if _G.CAlert_SavedChanges["CurrentFont"] ~= self.font then
			    _G["fontButton".._G.CAlert_SavedChanges["CurrentFont"]]:UnlockHighlight()

				self:LockHighlight()

				_G["ShowFontString"]:SetFont("Interface\\AddOns\\CAlert\\Fonts\\"..self.font..".TTF", 20, "THICKOUTLINE")

				_G.CAlert_SavedChanges["CurrentFont"] = self.font
			end
		end)
	end

	groupScrollFrame:SetScrollChild(groupFrame)

	local showFontString = fontFrame:CreateFontString("ShowFontString")
	showFontString:SetSize(260, 160)
	showFontString:SetPoint("TOPLEFT", 200, -20)
	showFontString:SetFont("Interface\\AddOns\\CAlert\\Fonts\\".._G.CAlert_SavedChanges["CurrentFont"]..".TTF", 20, "THICKOUTLINE")
	showFontString:SetJustifyV("MIDDLE")
	showFontString:SetTextColor(0.5, 1, 0.7, 1)
	showFontString:SetText("This is a test MESSAGE for checking of the fonts.\n0123456789!?")

	_G["fontButton".._G.CAlert_SavedChanges["CurrentFont"]]:LockHighlight()

end

CAlert_Chats = {"SAY", "PARTY", "RAID", "BATTLEGROUND", "YELL", "EMOTE"}
CAlert_Dbmessage = {["Type"] = {position = "1", message = "Silence"},
                   ["Link"] = {position = "2", message = "("..GetSpellLink("55021")..")"},
				   ["Caster"] = {position = "3", message = "from CasterName"}}
CAlert_Messages = {["1"] = "",
				   ["2"] = "",
				   ["3"] = ""}
CAlert_Say = "[Name] says:"
function DrawChatsFrame()

    local chatFrame = CreateFrame("Frame", "ChatsFrame", CAlert)
	chatFrame:SetSize(470, 190)
	chatFrame:SetPoint("TOPLEFT", 16, -50)
	chatFrame:Hide()

	local fontString = chatFrame:CreateFontString()
	fontString:SetSize(130, 15)
	fontString:SetFont("Interface\\AddOns\\CAlert\\Fonts\\".._G.CAlert_SavedChanges["CurrentFont"]..".TTF", 14, "THICKOUTLINE")
	fontString:SetJustifyH("LEFT")
	fontString:SetTextColor(0.9, 0.7, 0.1, 1)
	fontString:SetPoint("TOPLEFT", 15, 0)
	fontString:SetText("Chat")

	local cbOffsetX, cbOffsetY = 5, -25
	local fsOffsetX, fsOffsetY = 30, -30
	local cchat = 0
    for _, chat in pairs(CAlert_Chats) do

	    local checkbox = CreateFrame("CheckButton", "chatCheckBox"..chat, chatFrame, "UICheckButtonTemplate")
		checkbox:SetSize(20, 20)
		checkbox:SetPoint("TOPLEFT", cbOffsetX, cbOffsetY)
		checkbox.chat = chat
		checkbox:SetScript("OnClick", function(self)
		    if self:GetChecked() then
				_G.CAlert_SavedChanges["cbchat"][chat] = 1
			else
				_G.CAlert_SavedChanges["cbchat"][chat] = nil
			end
		end)
		cbOffsetX = cbOffsetX + 160

		local cfontString = chatFrame:CreateFontString()
		cfontString:SetSize(130, 13)
		cfontString:SetFont("Interface\\AddOns\\CAlert\\Fonts\\".._G.CAlert_SavedChanges["CurrentFont"]..".TTF", 12, "THICKOUTLINE")
		cfontString:SetJustifyH("LEFT")
	    cfontString:SetTextColor(0.9, 0.7, 0.1, 1)
	    cfontString:SetPoint("TOPLEFT", fsOffsetX, fsOffsetY)
		cfontString:SetText(chat)
		fsOffsetX = fsOffsetX + 160

		if fsOffsetX + 110 > chatFrame:GetWidth() then
		    cbOffsetX, cbOffsetY = 5, -45
			fsOffsetX, fsOffsetY = 30, -50
		end
    end

	local fontString1 = chatFrame:CreateFontString()
	fontString1:SetSize(130, 15)
	fontString1:SetFont("Interface\\AddOns\\CAlert\\Fonts\\".._G.CAlert_SavedChanges["CurrentFont"]..".TTF", 14, "THICKOUTLINE")
	fontString1:SetJustifyH("LEFT")
	fontString1:SetTextColor(0.9, 0.7, 0.1, 1)
	fontString1:SetPoint("TOPLEFT", 15, -90)
	fontString1:SetText("Message")

	cbOffsetX, cbOffsetY = 5, -115
	fsOffsetX, fsOffsetY = 30, -120

	for element in pairs(_G.CAlert_Dbmessage) do

	    local checkbox = CreateFrame("CheckButton", "messageCheckBox"..element, chatFrame, "UICheckButtonTemplate")
		checkbox:SetSize(20, 20)
		checkbox:SetPoint("TOPLEFT", cbOffsetX, cbOffsetY)
		checkbox.element = element
		checkbox.position = _G.CAlert_Dbmessage[element]["position"]
		checkbox:SetScript("OnClick", function(self)
		    if self:GetChecked() then
			    _G.CAlert_SavedChanges["cbmessage"][self.element] = self.position
				_G.CAlert_Messages[self.position] = _G.CAlert_Dbmessage[self.element]["message"]
				_G["MessageEditBox"]:SetText(string.format("%s %s%s %s", _G.CAlert_Say,
				                                                         _G.CAlert_Messages["1"],
																		 _G.CAlert_Messages["2"],
																		 _G.CAlert_Messages["3"]))
			else
			    _G.CAlert_SavedChanges["cbmessage"][self.element] = nil
				_G.CAlert_Messages[self.position] = ""
				_G["MessageEditBox"]:SetText(string.format("%s %s%s %s", _G.CAlert_Say,
				                                                         _G.CAlert_Messages["1"],
																		 _G.CAlert_Messages["2"],
																		 _G.CAlert_Messages["3"]))
			end
		end)
		cbOffsetX = cbOffsetX + 160

		local efontString = chatFrame:CreateFontString()
		local cfontString = chatFrame:CreateFontString()
		cfontString:SetSize(130, 13)
		cfontString:SetFont("Interface\\AddOns\\CAlert\\Fonts\\".._G.CAlert_SavedChanges["CurrentFont"]..".TTF", 12, "THICKOUTLINE")
		cfontString:SetJustifyH("LEFT")
	    cfontString:SetTextColor(0.9, 0.7, 0.1, 1)
	    cfontString:SetPoint("TOPLEFT", fsOffsetX, fsOffsetY)
		cfontString:SetText(element)
		fsOffsetX = fsOffsetX + 160
	end

	local editBox = CreateFrame("EditBox", "MessageEditBox", chatFrame, "InputBoxTemplate")
	editBox:SetSize(450, 20)
	editBox:SetPoint("TOPLEFT", 10, -145)
	editBox:Disable()

end

function GetClass(class)
    dbreturn = {}
    for id in pairs(dbspell) do
	    if dbspell[id]["class"] == class then
		    dbreturn[id] = {name = dbspell[id]["name"], iconPath = dbspell[id]["iconPath"]}
		end
	end

	return dbreturn
end

function SetCheckboxChanges()
    for id in pairs(_G.CAlert_SavedChanges["cbid"]) do
		_G["spellCheckBox"..id]:SetChecked(true)
	end

	for chat in pairs(_G.CAlert_SavedChanges["cbchat"]) do
		_G["chatCheckBox"..chat]:SetChecked(true)
	end

	for element in pairs(_G.CAlert_SavedChanges["cbmessage"]) do
	    _G["messageCheckBox"..element]:SetChecked(true)
	end
end

function SetEditboxChanges()
    for element in pairs(_G.CAlert_SavedChanges["cbmessage"]) do
	    _G.CAlert_Messages[_G.CAlert_SavedChanges["cbmessage"][element]] = _G.CAlert_Dbmessage[element]["message"]
	end

	_G["MessageEditBox"]:SetText(string.format("%s %s%s %s", _G.CAlert_Say,
				                                                         _G.CAlert_Messages["1"],
																		 _G.CAlert_Messages["2"],
																		 _G.CAlert_Messages["3"]))
end

function GetAbilities_PL()
    for id in pairs(_G.CAlert_SavedChanges["cbid"]) do
		_G.CAlert_Dbid[id] = {link = GetSpellLink(id), sType = dbspell[id]["spellType"]}
	end
end

function CAlert_Alert(player_name, dest_name, source_name, sid)
    if dest_name == player_name then
	    local id = tostring(sid)
		if _G.CAlert_Dbid[id] then
		    local first, second, third = "","",""
			for chat in pairs(_G.CAlert_SavedChanges["cbchat"]) do
			    local endof = 0
			    if _G["messageCheckBoxType"]:GetChecked() then first = _G.CAlert_Dbid[id]["sType"] else endof = endof + 1 end
				if _G["messageCheckBoxLink"]:GetChecked() then second = "(".._G.CAlert_Dbid[id]["link"]..")" else endof = endof + 1 end
				if _G["messageCheckBoxCaster"]:GetChecked() then third = "from "..(source_name or "UnNamed") else endof = endof + 1 end
				if endof == 3 then break end
				SendChatMessage(string.format("%s%s %s", first, second, third), chat)
			end
		end
	end
end

function CAlert_OnEvent(...)
    event = select(4, ...)
	if (event == "SPELL_AURA_APPLIED" or event == "SPELL_AURA_REFRESH") and _G.CAlert_Dbid then
	    player_name = UnitName("player")
		dest_name = select(11, ...)
		source_name = select(7, ...)
		sid = select(14, ...)
	    CAlert_Alert(player_name, dest_name, source_name, sid)
    else
        event = select(2, ...)
        if event == "VARIABLES_LOADED" then
		    if not _G.CAlert_SavedChanges then
		        _G.CAlert_SavedChanges = {}
		        _G.CAlert_SavedChanges["CurrentFont"] = "MORPHEUS"
			    _G.CAlert_SavedChanges["cbid"] = {}
				_G.CAlert_SavedChanges["cbchat"] = {["SAY"] = 1}
				_G.CAlert_SavedChanges["cbmessage"] = { ["Type"] = "1", ["Link"] = "2", ["Caster"] = "3" }
		    end
	    elseif event == "PLAYER_LOGIN" then
	        print("Calert AddOn is Loaded")
		    GetAbilities_PL()
			DrawAbilitiesMenu()
			DrawFontsFrame()
			DrawChatsFrame()
			SetCheckboxChanges()
			SetEditboxChanges()
	    end
	end
end

function closeButton_OnClick()
	CAlert:Hide()
end

function allCheckButton_OnClick()
    for id in pairs(dbspell) do
		_G["spellCheckBox"..id]:SetChecked(true)
		_G.CAlert_Dbid[id] = {link = GetSpellLink(id), sType = dbspell[id]["spellType"]}
		_G.CAlert_SavedChanges["cbid"][id] = 1
	end
end

function allUnCheckButton_OnClick()
    for id in pairs(dbspell) do
		_G["spellCheckBox"..id]:SetChecked(false)
		_G.CAlert_Dbid[id] = nil
	end
	wipe(_G.CAlert_SavedChanges["cbid"])
end

CAlert_DDMenu = {"AbilitiesScrollFrame", "FontsFrame", "ChatsFrame"}
CAlert_CurrentMenu = 1
function DropDownFrame_Initialize()
	menuList = {}
	menuList.text = "Abilities Menu"
	menuList.func = function()
	                            _G[_G.CAlert_DDMenu[1]]:Show()
								allCheckButton:Show()
								allUnCheckButton:Show()

								_G[_G.CAlert_DDMenu[_G.CAlert_CurrentMenu]]:Hide()
                                UIDropDownMenu_SetSelectedID(DropDownFrame, 1, 1)
								_G.CAlert_CurrentMenu = 1
								end
	UIDropDownMenu_AddButton(menuList, 1)

	wipe(menuList)
	menuList.text = "Font Settings"
	menuList.func = function()
								_G[_G.CAlert_DDMenu[2]]:Show()
								if _G.CAlert_CurrentMenu == 1 then
							        allCheckButton:Hide()
							        allUnCheckButton:Hide()
                                end

                                _G[_G.CAlert_DDMenu[_G.CAlert_CurrentMenu]]:Hide()
							    UIDropDownMenu_SetSelectedID(DropDownFrame, 2, 1)
							    _G.CAlert_CurrentMenu = 2
	                            end
	UIDropDownMenu_AddButton(menuList, 1)

	wipe(menuList)
	menuList.text = "Chat Settings"
	menuList.func = function()
	                            _G[_G.CAlert_DDMenu[3]]:Show()
                                if _G.CAlert_CurrentMenu == 1 then
							        allCheckButton:Hide()
							        allUnCheckButton:Hide()
								end

								_G[_G.CAlert_DDMenu[_G.CAlert_CurrentMenu]]:Hide()
								UIDropDownMenu_SetSelectedID(DropDownFrame, 3, 1)
							    _G.CAlert_CurrentMenu = 3
								end
	UIDropDownMenu_AddButton(menuList, 1)
end

SLASH_CALERT1 = "/calert"
function SlashCmdList.CALERT(msg, editbox)
    if msg == "show" then
		CAlert:Show()
	end
end







