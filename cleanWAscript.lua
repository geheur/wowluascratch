function bla()
local auraID = "0CleanerTemplate"
local tempAuraID = auraID .. " - hopefully unused name"
local cleanedAuraID = auraID .. " - Cleaned"
print("cleaning \""..auraID.."\"")

local function createCopyOnReadMetatable(original, tableToCopyTo)
	local mt = {}
	mt.__index = function(table, key)
		--if key == "customTriggerLogic" then print("here") end
		--if key == "customTriggerLogic" then local a = {} a[nil] = 0 print("here") end
		--print("index", key)
		local value = original[key]
		if value == nil then return value end
		if type(value) == "table" then
			if not getmetatable(value) or not getmetatable(value).__isCopyOnWrite then
				--print("table access")
				local copyTable = {}
				local meta = createCopyOnReadMetatable(value, copyTable)
				tableToCopyTo[key] = copyTable
				original[key] = meta

				for i,v in ipairs(value) do
					if type(v) == "table" then
						local copyTable2 = {}
						local meta2 = createCopyOnReadMetatable(v, copyTable2)
						copyTable[i] = copyTable2
						meta[i] = meta2
					else
						copyTable[i] = v
					end
				end

				return meta
			end
		else
			tableToCopyTo[key] = value
		end
		return value
	end
	-- Not in 5.2 :(
	--mt.__pairs = function(table)
		--return next, original, nil
	--end
	mt.__isCopyOnWrite = true
	return setmetatable({}, mt)
end

local tableDiff
do
	local separator = "      "
	local previous_tostring = tostring
	local function tostring(arg)
		if type(arg) == "table" then
			return "{}"
		end
		return previous_tostring(arg)
	end
	tableDiff = function(original, modified, path)
		path = path or ""
		local changed = false
		local contents = {}
		for i,v in pairs(original) do
			if not contents[i] then contents[i] = {original=type(v)}
			else contents[i].original = type(v) end
			if type(v) == "table" then
				contents[i].originalChild = v
			end
		end
		for i,v in pairs(modified) do
			if not contents[i] then contents[i] = {modified=type(v)}
			else contents[i].modified = type(v) end
			if type(v) == "table" then
				contents[i].modifiedChild = v
			end
		end

		for i,v in pairs(contents) do
			local newPath = path.."."..i
			local bothAreTables = v.original == "table" and v.modified == "table"
			if bothAreTables then
				-- TODO pass back invocation's contents table, store somewhere.
				local childrenChanged = tableDiff(v.originalChild, v.modifiedChild, newPath)
				if childrenChanged then
					changed = true
				else
					-- discard
					--contents[i] = nil
				end
			else
				if v.original and v.modified then
					if original[i] ~= modified[i] then
						changed = true
						print("M "..newPath..separator..tostring(original[i]).." -> "..tostring(modified[i]))
					else
						-- discard
						--contents[i] = nil
					end
					--tableDiff(v.originalChild, v.modifiedChild, path.."."..i)
				elseif v.original then
					changed = true
					print("- "..newPath..separator..tostring(original[i]))
				elseif v.modified then
					changed = true
					print("+ "..newPath..separator..tostring(modified[i]))
				else error("bla") end

				if v.original == "table" then
					tableDiff(v.originalChild, {}, newPath)
				end
				if v.modified == "table" then
					tableDiff({}, v.modifiedChild, newPath)
				end
			end
		end

		return changed
	end
end

local function addAura(data)
	WeakAurasSaved.displays[data.id] = data
	WeakAuras.Add(data)
	--WeakAuras.AddDisplayButton(data)
end

local function addAuraAndDisplay(data)
	WeakAurasSaved.displays[data.id] = data
	WeakAuras.Add(data)
	WeakAuras.AddDisplayButton(data)
end

local function deleteAura(id)
	if WeakAurasSaved.displays[id] then
		--WeakAuras.DeleteOption(WeakAurasSaved.displays[id])
		WeakAuras.Delete(WeakAurasSaved.displays[id])
	end
end

local function deleteAuraAndDisplay(id)
	if WeakAurasSaved.displays[id] then
		WeakAuras.DeleteOption(WeakAurasSaved.displays[id])
		--WeakAuras.Delete(WeakAurasSaved.displays[id])
	end
end

if (WeakAuras.IsOptionsOpen()) then WeakAuras.OpenOptions() else WeakAuras.OpenOptions() WeakAuras.OpenOptions() end

deleteAuraAndDisplay(cleanedAuraID)
deleteAura(tempAuraID)

originalAura = WeakAurasSaved.displays[auraID]
ViragDevTool_AddData(originalAura, "originalAura")
local dataCopy = {}
WeakAuras.DeepCopy(originalAura, dataCopy) -- TODO figure out why DeepCopy doesn't work.
dataCopy.id = tempAuraID
auraCopy = {}
ViragDevTool_AddData(auraCopy, "auraCopy")
meta = createCopyOnReadMetatable(dataCopy, auraCopy)


addAura(meta)

local cleanedAura = {}
WeakAuras.DeepCopy(auraCopy, cleanedAura)
cleanedAura.id = cleanedAuraID

addAuraAndDisplay(cleanedAura)
deleteAura(tempAuraID)

print("differences between original and cleaned aura:")
tableDiff(originalAura, cleanedAura)
end

C_Timer.After(0, bla)
--[[
/script tableDiff(originalAura, auraCopy)
/script WeakAurasSaved.displays["0CleanerTemplate - hopefully unused name"] = nil
/script WeakAurasSaved.displays["0CleanerTemplate - Cleaned"] = nil
/script WeakAurasSaved.displays["Seals - hopefully unused name"] = nil
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

