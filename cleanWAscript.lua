function bla()

local auraID = "0CleanerTemplate"
local tempAuraID = auraID .. " - hopefully unused name"
local cleanedAuraID = auraID .. " - Cleaned"
print("cleaning \""..auraID.."\"")

local function addAura(data)
	print("adding " .. data.id)
	WeakAurasSaved.displays[data.id] = meta
	WeakAuras.Add(data)
	WeakAuras.AddDisplayButton(data)
end

local function deleteAura(id)
	if WeakAurasSaved.displays[id] then
		WeakAuras.Delete(WeakAurasSaved.displays[id])
		WeakAurasSaved.displays[id] = nil
	end
end

if (WeakAuras.IsOptionsOpen()) then WeakAuras.OpenOptions() else WeakAuras.OpenOptions() WeakAuras.OpenOptions() end

deleteAura(cleanedAuraID)
deleteAura(tempAuraID)

auraCopy = {}
originalAura = WeakAurasSaved.displays[auraID]

local dataCopy = {}
WeakAuras.DeepCopy(originalAura, dataCopy) -- TODO figure out why DeepCopy doesn't work.
dataCopy.id = tempAuraID

meta = createCopyOnReadMetatable(dataCopy, auraCopy)

addAura(meta)

--meta = createCopyOnReadMetatable(originalAura, auraCopy)
--WeakAurasSaved.displays[tempAuraID] = meta

local actions = {
function() WeakAuras.OpenOptions() end,
function() WeakAuras.PickDisplay(tempAuraID) end,
function() AceGUITabGroup1Tab1:Click() end,
function() AceGUITabGroup1Tab2:Click() end, -- Triggers.
function() AceGUITabGroup1Tab3:Click() end,
function() AceGUITabGroup1Tab4:Click() end,
function() AceGUITabGroup1Tab5:Click() end,
function() AceGUITabGroup1Tab6:Click() end,
function()
	--WeakAurasSaved.displays[tempAuraID] = originalAura

	ViragDevTool_AddData(dataCopy, "dataCopy")
	ViragDevTool_AddData(meta, "meta")

	ViragDevTool_AddData(originalAura, "originalAura")
	ViragDevTool_AddData(auraCopy, "auraCopy")
end,
function() WeakAuras.OpenOptions() end,
function()
	addAura(auraCopy)

	tableDiff(originalAura, auraCopy)

	WowLuaFrameEditBox:SetText(s)
	print("done")
end,
}

local function performActions(actions, index)
	index = index or 1
	if index == #actions + 1 then return end
	C_Timer.After(.2, function()
		print("performing action "..index)
		actions[index]()
		performActions(actions, index + 1)
	end)
end

performActions(actions)

print("success!")

end

bla()
--[[
/script tableDiff(originalAura, auraCopy)
/script WeakAurasSaved.displays["0CleanerTemplate - hopefully unused name"] = nil
/script WeakAurasSaved.displays["0CleanerTemplate - Cleaned"] = nil
/script ViragDevTool_AddData(WeakAurasSaved.displays["0Event"], "aura")
/script WeakAurasSaved.displays["Seals 2 - hopefully unused name"] = nil

/script WeakAurasSaved.displays["0CleanerTest 2"].garbage = "some shit"
/script WeakAurasSaved.displays["0CleanerTest 2"].garbageTable = {bla="bla",crap=3}

/script WeakAurasSaved.displays["Seals 2"] = nil
/script WeakAurasSaved.displays["0CleanerTest 2"] = auraCopy
/script WeakAurasSaved.displays["0CleanerTest 2"] = originalAura
/script ViragDevTool_AddData(WeakAurasSaved.displays["0CleanerTest 2"], "0CleanerTest 2")
/script ViragDevTool_AddData(WeakAurasSaved.displays["0CleanerTest"], "0CleanerTest")
/script ViragDevTool_AddData(WeakAurasSaved.displays["Seals 2"], "0CleanerTest 2") ViragDevTool_AddData(WeakAurasSaved.displays["Seals"], "0CleanerTest")
/script ViragDevTool_AddData(WeakAuras.displayButtons, "displayButtons")
/script WeakAurasSaved.displays[ "0CleanerTest 2"].testIfThisIsRemoved = "remove me!"
/script WeakAuras.OpenOptions()

    trigger = data.triggers[triggerNum].trigger;

/dump WeakAurasSaved.displays["0CleanerTest 2"]
/dump WeakAurasSaved.displays["0CleanerTest 2"].triggers
/dump WeakAurasSaved.displays["0CleanerTest 2"].triggers[2].trigger
/dump WeakAuras.optionTriggerChoices["0CleanerTest 2"]

/script WeakAuras.OpenOptions()
/script WeakAuras.PickAndEditDisplay("0CleanerTest 2")
/script WeakAuras.PickDisplay("0CleanerTest 2")
PickDisplay
/script AceGUITabGroup1Tab1:Click()
/script AceGUITabGroup1Tab2:Click() -- Triggers.
/script AceGUITabGroup1Tab3:Click()
/script AceGUITabGroup1Tab4:Click()
/script AceGUITabGroup1Tab5:Click()
/script AceGUITabGroup1Tab6:Click()
--]]

--[[
local testcopyonreadtable = false
if testcopyonreadtable then
	local copy = {}
	local test = {[1]="one", two="two", table={three="three", four="four"}}
	local meta = createCopyOnReadMetatable(test, copy)
	local _ = meta[1]
	local _ = meta.table.three
	print("results:")
	print("copy[1]", copy[1])
	print("copy.two.", copy["two"])
	print("copy.table", copy["table"])
	print("copy.table.three", copy.table.three)
	print("copy.table.four", copy.table.four)

	print("copytablecopy.three", copytablecopy.three)
	print("copytablecopy.four", copytablecopy.four)

	if true then return end
end
--]]

--setmetatable(originalAura, createCopyOnReadMetatable(cleanedAura))

--[[
print("meta:", meta)
print(meta.triggers)
print(meta.triggers[1])
print(meta.triggers[1].trigger)
_G["auraCopy"] = auraCopy
_G["originalAura"] = originalAura
_G["meta"] = meta
if true then return end
--]]


--[[
--This does nothing.
local a = {[tempAuraID]=true}
WeakAuras.LoadDisplays(a)

--Neither does this.
WeakAuras.ReloadAll()
--]]
--if true then return end

