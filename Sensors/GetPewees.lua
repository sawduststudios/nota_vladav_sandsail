local sensorInfo = {
	name = "GetPeewees",
}

local EVAL_PERIOD_DEFAULT = -1 -- no caching 

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end

-- @description return filtered list of units
-- @argument listOfUnits [array of unitIDs] unfiltered list 
-- @argument category [table] BETS category
-- @return newListOfUnits [array of unitIDS] filtered list
return function(listOfUnits, category)
	local newListOfUnits = {}
	
	for i=1, #listOfUnits do
		local thisUnitID = listOfUnits[i]
		local thisUnitDefID = Spring.GetUnitDefID(thisUnitID)
		if (category[thisUnitDefID] ~= nil) then -- in category
			newListOfUnits[#newListOfUnits + 1] = thisUnitID
		end 
	end
	
	return newListOfUnits
end