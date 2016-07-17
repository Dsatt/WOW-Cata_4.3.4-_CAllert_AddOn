dbspell = {
            -- Mage
			["55021"] = {
				name="Counterspell", spellType="Silence", class="Mage", iconPath="Interface\\ICONS\\Spell_Frost_IceShock"},
			["44572"] = {
				name="Deep Freeze", spellType="Stunning", class="Mage", iconPath="Interface\\ICONS\\Ability_Mage_DeepFreeze"},
			["118"] = {
			    name="Polymorph", spellType="Control", class="Mage", iconPath="Interface\\ICONS\\Spell_Nature_Polymorph"},
			["31661"] = {
			    name="Dragon's Breath", spellType="Disorientation", class="Mage", iconPath="Interface\\ICONS\\INV_Misc_Head_Dragon_01"},

			-- Priest
			["8122"] = {
			    name="Psychic Scream", spellType="Fear", class="Priest", iconPath="Interface\\ICONS\\Spell_Shadow_PsychicScream"},
			["43550"] = {
			    name="Mind Control", spellType="Control", class="Priest", iconPath="Interface\\ICONS\\Spell_Shadow_ShadowWordDominate"},
			["15487"] = {
			    name="Silence", spellType="Silence", class="Priest", iconPath="Interface\\ICONS\\Ability_Priest_Silence"},

			-- Warlock
				["5484"] = {
				    name="Howl of Terror", spellType="Fear", class="Warlock", iconPath="Interface\\ICONS\\Spell_Shadow_DeathScream"},
				["5782"] = {
				    name="Fear", spellType="Fear", class="Warlock", iconPath="Interface\\ICONS\\Spell_Shadow_Possession"},
				["6358"] = {
				    name="Succubus: Seduction", spellType="Control", class="Warlock", iconPath="Interface\\ICONS\\Spell_Shadow_MindSteal"},
				["19647"] = {
				    name="Felhunter: Spell Lock", spellType="Silence", class="Warlock", iconPath="Interface\\ICONS\\Spell_Shadow_MindRot"},
				["89766"] = {
				    name="Felguard: Axe Toss", spellType="Stunning", class="Warlock", iconPath="Interface\\ICONS\\Ability_Warrior_TitansGrip"},

			-- Hunter
			    ["1499"] = {
				    name="Freezing Trap", spellType="Trap", class="Hunter", iconPath="Interface\\ICONS\\Spell_Frost_ChainsOfIce"},
				["19577"] = {
				    name="Intimidation", spellType="Stunning", class="Hunter", iconPath="Interface\\ICONS\\Ability_Devour"},
				["90337"] = {
				    name="Monkey: Bad Manner", spellType="Disorientation", class="Hunter", iconPath="Interface\\ICONS\\Ability_Hunter_AspectOfTheMonkey"},
				["96201"] = {
				    name="Shale Spider: Web Wrap", spellType="Stunning", class="Hunter", iconPath="Interface\\ICONS\\Spell_Nature_Web"},
				["34490"] = {
				    name="Silencing Shot", spellType="Silence", class="Hunter", iconPath="Interface\\ICONS\\Ability_TheBlackArrow"},
				["19503"] = {
				    name="Scatter Shot", spellType="Disorientation", class="Hunter", iconPath="Interface\\ICONS\\Ability_GolemStormBolt"},
				["19386"] = {
				    name="Wyvern Sting", spellType="Sap", class="Hunter", iconPath="Interface\\ICONS\\INV_Spear_02"},

			-- Shaman
			    ["51514"] = {
				    name="Hex", spellType="Control", class="Shaman", iconPath="Interface\\ICONS\\Spell_Shaman_Hex"},

			-- Rogue
			    ["408"] = {
				    name="Kidney Shot", spellType="Stunning", class="Rogue", iconPath="Interface\\ICONS\\Ability_Rogue_KidneyShot"},
				["1776"] = {
				    name="Gouge", spellType="Stunning", class="Rogue", iconPath="Interface\\ICONS\\Ability_Gouge"},
				["1833"] = {
				    name="Cheap Shot", spellType="Stunning", class="Rogue", iconPath="Interface\\ICONS\\Ability_CheapShot"},
				["1330"] = {
				    name="Garrote", spellType="Silence", class="Rogue", iconPath="Interface\\ICONS\\Ability_Rogue_Garrote"},
				["2094"] = {
				    name="Blind", spellType="Blinding", class="Rogue", iconPath="Interface\\ICONS\\Spell_Shadow_MindSteal"},
				["6770"] = {
				    name="Sap", spellType="Sap", class="Rogue", iconPath="Interface\\ICONS\\Ability_Sap"},

			-- Druid
			    ["5211"] = {
				    name="Mighty Bash", spellType="Stunning", class="Druid", iconPath="Interface\\ICONS\\Ability_Druid_Bash"},
				["9005"] = {
				    name="Pounce", spellType="Stunning", class="Druid", iconPath="Interface\\ICONS\\Ability_Druid_SupriseAttack"},
				["22570"] = {
				    name="Maim", spellType="Stunning", class="Druid", iconPath="Interface\\ICONS\\Ability_Druid_Mangle"},
				["33786"] = {
				    name="Cyclone", spellType="Control", class="Druid", iconPath="Interface\\ICONS\\Spell_Nature_EarthBind"},

            -- Death Knight
			    ["47476"] = {
				    name="Strangulate", spellType="Silence", class="Death Knight", iconPath="Interface\\ICONS\\Spell_Shadow_SoulLeech_3"},
				["47481"] = {
				    name="Ghoul: Gnaw", spellType="Stunning", class="Death Knight", iconPath="Interface\\ICONS\\Spell_DeathKnight_Gnaw_Ghoul"},

			-- Paladin
			    ["853"] = {
				    name="Hammer of Justice", spellType="Stunning", class="Paladin", iconPath="Interface\\ICONS\\Spell_Holy_SealOfMight"},
				["20066"] = {
				    name="Repentance", spellType="Sap", class="Paladin", iconPath="Interface\\ICONS\\Spell_Holy_PrayerOfHealing"},

			-- Warrior
			    ["5246"] = {
				    name="Intimidating Shout", spellType="Fear", class="Warrior", iconPath="Interface\\ICONS\\Ability_GolemThunderClap"},
				["46968"] = {
				    name="Shockwave", spellType="Stunning", class="Warrior", iconPath="Interface\\ICONS\\Ability_Warrior_Shockwave"},
				["100"] = {
				    name="Charge", spellType="Stunning", class="Warrior", iconPath="Interface\\ICONS\\Ability_Warrior_Charge"}
		  }

gameclass = {
              "Mage",
			  "Priest",
			  "Hunter",
			  "Death Knight",
			  "Warrior",
			  "Shaman",
			  "Warlock",
			  "Rogue",
			  "Druid",
			  "Paladin"
}

classcolor = {
			   ["Mage"] = { r = 0.40, g = 0.80, b = 0.93 },
			   ["Priest"] = { r = 1.0, g = 1.0, b = 1.0 },
			   ["Hunter"] = { r = 0.66, g = 0.82, b = 0.44 },
			   ["Death Knight"] = { r = 0.76, g = 0.11, b = 0.23 },
			   ["Warrior"] = { r = 0.77, g = 0.60, b = 0.42 },
			   ["Shaman"] = { r = 0.13, g = 0.34, b = 1.0 },
			   ["Warlock"] = { r = 0.57, g = 0.50, b = 0.78 },
			   ["Rogue"] = { r = 1.0, g = 0.95, b = 0.40 },
			   ["Druid"] = { r = 1.0, g = 0.48, b = 0.03 },
			   ["Paladin"] = { r = 0.95, g = 0.54, b = 0.72 }
}
