local sensorInfo = {
	name = "GetUnitsToRescue",
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
	local unitsToRescue = {}
	
	for i=1, #listOfUnits do
		local thisUnitID = listOfUnits[i]
		local thisUnitDefID = Spring.GetUnitDefID(thisUnitID)
		if (UnitDefs[thisUnitDefID].name ~= "armatlas" 
			and UnitDefs[thisUnitDefID].name ~= "armpeep" 
			and not UnitDefs[thisUnitDefID].cantBeTransported 
			and not Spring.GetUnitIsDead(thisUnitID)
		) then -- TODO: check this
			local unitX, unitY, unitZ = Spring.GetUnitPosition(thisUnitID)
			if (unitX > 3100 and unitZ < 5800) then
				unitsToRescue[#unitsToRescue + 1] = thisUnitID
			end
		end
	end
	
	return unitsToRescue
end