
local function isAutocasting(slot)
	return not _G["BT4PetButton"..slot.."AutoCastable"]:IsVisible()
	--[[
	if not _G["BT4PetButton"..slot.."Shine1"]:IsVisible() then
		return false
	elseif not _G["BT4PetButton"..slot.."AutoCastable"]:IsVisible() then
		return true
	end
	--]]
end

ChatFrame5:AddMessage("true")

--[[
local previousshow = BT4PetButton4AutoCastable.Show
function BT4PetButton4AutoCastable:Show(...) print("shown") WeakAuras.ScanEvents("PRIMAL_ELEMENTALIST_CUSTOM_EVENT") previousshow(self, ...) end
local previoushide = BT4PetButton4AutoCastable.Hide
function BT4PetButton4AutoCastable:Hide(...) print("hidden") WeakAuras.ScanEvents("PRIMAL_ELEMENTALIST_CUSTOM_EVENT") previoushide(self, ...) end

local previousshow = BT4PetButton4Shine1.Show
function BT4PetButton4Shine1:Show(...) print("shown") WeakAuras.ScanEvents("PRIMAL_ELEMENTALIST_CUSTOM_EVENT") previousshow(self, ...) end
local previoushide = BT4PetButton4Shine1.Hide
function BT4PetButton4Shine1:Hide(...) print("hidden") WeakAuras.ScanEvents("PRIMAL_ELEMENTALIST_CUSTOM_EVENT") previoushide(self, ...) end
--]]

ViragDevTool_AddData(original, "original")

function() if not viragadded1 and aura_env.status then ViragDevTool_AddData(aura_env.status, "aura staus") viragadded1 = true end end

function(cleu, ...) local spellID = select(12, ...) print(spellID) end

aura_env.customtrigger = function(...)
	if (...) ~= "PRIMAL_ELEMENTALIST_CUSTOM_EVENT" then
		C_Timer.After(.0001, function() WeakAuras.ScanEvents("PRIMAL_ELEMENTALIST_CUSTOM_EVENT") end)
	end
	print("triggered", UnitName("pet"), isAutocasting(4), _G["BT4PetButton".."4".."AutoCastable"]:IsVisible(), _G["BT4PetButton".."4".."Shine1"]:IsVisible())
	if UnitName("pet") == "Primal Fire Elemental" then
		if not isAutocasting(4) then
			aura_env.mytext = "|cFFFF0000MOTHERFUCKING BLAST DISABLED|r"
			return true
		end
	elseif UnitName("pet") == "Primal Earth Elemental" then
		if isAutocasting(4) then
			aura_env.mytext = "|cFF705234TAUNTING|r"
			return true
		end
	elseif UnitName("pet") == "Wolf" then
		if not isAutocasting(4) then
			aura_env.mytext = "|cFFFF0000MOTHERFUCKING BLAST DISABLED|r"
			return true
		else
			aura_env.mytext = "|cFF705234WOLFIETAUNT|r"
			return true
		end
	else
		aura_env.mytext = ""
		return false
	end
end

function()
    return GetActionAutocast
end

/script local a = CommunitiesFrame.Chat.MessageFrame.FontStringContainer[0].messageInfo for i,v in pairs(a) do print(i) end

/script local a = CommunitiesFrame.Chat.MessageFrame.FontStringContainer[0] for i,v in pairs(a) do print(i,v) end

function()
	for i,v in pairs(aura_env.state) do
		print(i,v)
	end
end

function()
	return math.floor(aura_env.state.expirationTime - GetTime())
end

/script print("hello") for i=0,10000 do if GetActionAutocast(i) ~= false then print(i, GetActionAutocast(i)) end end
/script print(GetActionAutocast(13))
`/script for i=0,10000 do if GetActionAutocast(i) ~= false then print(i, GetActionAutocast(i)) end end` prints `13 true true` on my hunter when growl is autocast, `13 true false` when not autocast. However, it does not print anything on my shaman when an elemental is summoned, even after toggling on/off autocasts. So, I don't think this would work. I also searched Bartender for `GetActionAutocast`, and it doesn't seem to use it anywhere (at least not by name). It looks like it uses Blizzard's PetActionButtonTemplate in some way.

`/script for i=0,10000 do if GetActionAutocast(i) ~= false then print(i, GetActionAutocast(i)) end end` prints `13 true true` on my hunter when growl is autocast, `13 true false` when not autocast. However, it does not print anything on my shaman when an elemental is summoned. So, I don't think this would work. I also searched Bartender for `GetActionAutocast`, and it doesn't seem to use it anywhere (at least not by name). It looks like it uses Blizzard's PetActionButtonTemplate in some way.

/script PetActionButton7Shine:HookScript("OnShow", function() print("show") end)
/script PetActionButton7Shine:HookScript("OnHide", function() print("hide") end)
/script for i,v in pairs(C_PetJournal) do if i:find("Num") then print(i,v) end end
/dump C_PetJournal.GetNumPets()
/script for i,v in pairs(PetActionButton7Shine.sparkles) do print(i,v) end
/script for i,v in pairs(PetActionButton7Shine.sparkles[1]) do print(i,v) end

/script print(select(3,GetSpellInfo(193455)))

PetActionButtonTemplate

/script print(true and nil or "two")

/script print(Get

/script print("|TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_1.blp|t Star")
/script SendChatMessage("|TInterface\\Icons\\INV_Misc_Coin_01:16|t Coins", "SAY")
/script print("|TInterface\\Icons\\INV_Misc_Coin_01:16|t Coins")
|TInterface\\Icons\\INV_Misc_Coin_01:16|t Coins
Interface\\TARGETINGFRAME\\UI-RaidTargetingIcon_1.blp]]

/script print(UnitName("pet"))

"UNIT_PET", "PET_BAR_UPDATE"

/script print(_G["BT4PetButton".."4".."AutoCastable"]:IsVisible(), _G["BT4PetButton".."4".."Shine1"]:IsVisible())

/script if not _G["BT4PetButton"..slot.."Shine1"]:IsVisible() then print(false) elseif not _G["BT4PetButton"..slot.."AutoCastable"]:IsVisible() then print(true) end

UNIT_PET,PET_BAR_UPDATE,PRIMAL_ELEMENTALIST_CUSTOM_EVENT,PET_BAR_UPDATE_COOLDOWN

local function isAutocasting(slot)
	return not _G["BT4PetButton"..slot.."AutoCastable"]:IsVisible()
	--[[
	if not _G["BT4PetButton"..slot.."Shine1"]:IsVisible() then
		return false
	elseif not _G["BT4PetButton"..slot.."AutoCastable"]:IsVisible() then
		return true
	end
	--]]
end

local previousshow = BT4PetButton4AutoCastable:Show
--function BT4PetButton4AutoCastable:Show(self, ...) print("shown") WeakAuras.ScanEvents("PRIMAL_ELEMENTALIST_CUSTOM_EVENT") previousshow(self, ...) end
BT4PetButton4AutoCastable.Show = function(self, ...) print("shown") WeakAuras.ScanEvents("PRIMAL_ELEMENTALIST_CUSTOM_EVENT") previousshow(self, ...) end
local previoushide = BT4PetButton4AutoCastable:Hide
--function BT4PetButton4AutoCastable:Hide(self, ...) print("hidden") WeakAuras.ScanEvents("PRIMAL_ELEMENTALIST_CUSTOM_EVENT") previoushide(self, ...) end
BT4PetButton4AutoCastable.Hide = function(self, ...) print("hidden") WeakAuras.ScanEvents("PRIMAL_ELEMENTALIST_CUSTOM_EVENT") previoushide(self, ...) end

aura_env.customtrigger = function()
	print("triggered", UnitName("pet"), isAutocasting(4), _G["BT4PetButton".."4".."AutoCastable"]:IsVisible(), _G["BT4PetButton".."4".."Shine1"]:IsVisible())
	if UnitName("pet") == "Primal Fire Elemental" then
		if not isAutocasting(4) then
			aura_env.mytext = "|cFFFF0000MOTHERFUCKING BLAST DISABLED|r"
			return true
		end
	elseif UnitName("pet") == "Primal Earth Elemental" then
		if isAutocasting(4) then
			aura_env.mytext = "|cFF705234TAUNTING|r"
			return true
		end
	elseif UnitName("pet") == "Wolf" then
		if not isAutocasting(4) then
			aura_env.mytext = "|cFFFF0000MOTHERFUCKING BLAST DISABLED|r"
			return true
		else
			aura_env.mytext = "|cFF705234WOLFIETAUNT|r"
			return true
		end
	else
		aura_env.mytext = ""
		return false
	end
end

function()
    return"|T"..select(3, GetSpellInfo("Crusader Strike"))..":0|t"
 end

/script print("|TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_1.blp:0|t Star")
function()
    return "|TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_1.blp:0|t Star"
 end
function()
    return "|TInterface\\Icons\\INV_Misc_Coin_01:16|t Coins"
 end
function()
    return "{star}"
 end
    
    
    
    
    
    
    
    
    
    

























local buffname = "Vantus Rune: Fetid Devourer" 
local counta = 0
for i=1,20 do
	local unit = "raid"..i
	for j=1,40 do
		name, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, nameplateShowAll, timeMod, value1, value2, value3 = UnitBuff(unit, j)
		if not name then break end
		if name == buffname then counta = counta + 1 break end
		print(j, name)
	end
end
print(buffname, counta)

local s = ""
for i,v in pairs(WeakAuras.auras) do
	s = s..type(v).." "..i.."\n"
end
WowLuaFrameEditBox:SetText(s)

WeakAuras.regions["Shaman_Restoration_AfenarUI"]

local s = ""
for i,v in pairs(WeakAuras.regions) do
	s = s..type(v).." "..i.."\n"
end
WowLuaFrameEditBox:SetText(s)

for id, region in pairs(regions) do
 if (region.region.ControlChildren) then
	region.region:Suspend();
 end
end

local s = ""
for i,v in pairs(WeakAuras.auras) do
	if type(v) == "table" then
		for i2,v2 in pairs(v) do
			if type(i2) == "string" then
				if i2:find("fenar") then
					print(i, i2)
				end
			end
		end
	end
	s = s..type(v).." "..i.."\n"
end

local function mylisten(event, message, author, language)
	print(author, language)
	print(message)
	WowLuaFrameEditBox:SetText(author)
end
local f = CreateFrame("Frame")
f:RegisterEvent("CHAT_MSG_SAY")
f:SetScript("OnEvent", mylisten)
print("successfully set /s to go to wowlua")

/script WowLuaFrameEditBox:SetText("hello")

/script dum
/dump C_Garrison.GetAvailableMissions()
/api search GetAvailableMissions

CUSTOM_BATTLE_SCARRED_AUGMENT_RUNE_MISSION_DETECTOR_EVENT,GARRISON_MISSION_LIST_UPDATE

function aura_env.trigger1()
	local missions = C_Garrison.GetAvailableMissions(GetPrimaryGarrisonFollowerType(LE_GARRISON_TYPE_8_0))
	if not missions then return false end
	local quantity
	for i,mission in ipairs(missions) do
		for i,reward in ipairs(mission.rewards) do
			if reward.itemID and reward.itemID == 160053 then
				quantity = reward.quantity
				break
			end
		end
	end
	return quantity
end

WeakAuras.ScanEvents("CUSTOM_BATTLE_SCARRED_AUGMENT_RUNE_MISSION_DETECTOR_EVENT")


CHALLENGE_MODE_KEYSTONE_SLOTTED,CHALLENGE_MODE_KEYSTONE_RECEPTABLE_OPEN
/dump GetInstanceInfo()

QUEST_COMPLETE,QUEST_POI_UPDATE,QUEST_QUERY_COMPLETE,QUEST_DETAIL,QUEST_FINISHED,QUEST_LOG_UPDATE,QUEST_PROGRESS,QUEST_ITEM_UPDATE,QUEST_WATCH_UPDATE,QUEST_ACCEPT_CONFIRM,QUEST_ACCEPTED

local data = {}
local aura = WeakAuras.DeepCopy(WeakAurasSaved.displays["0CleanerTest 2"], data)

/dump WeakAuras.triggerState["RUN 2"].triggers[1]
/dump WeakAuras.triggerState["orbbla"].triggers[1]

