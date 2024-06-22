local sensorInfo = {
	name = "GetLivingRescueTarget",
}

local EVAL_PERIOD_DEFAULT = -1 -- no caching 

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end

-- @description return a living unit id to rescue from a list of units
-- @argument listOfUnits [array of unitIDs] unfiltered list
-- @argument safeAreaCenter [table] {x, y, z}
-- @argument safeAreaRadius [number] radius of the safe area
-- @return living unit to rescue [unitID]
return function(listOfUnits, safeAreaCenter, safeAreaRadius)	
	for i=1, #listOfUnits do
		local thisUnitID = listOfUnits[i]
		if (not Spring.GetUnitIsDead(thisUnitID)) then
			local thisUnitDefID = Spring.GetUnitDefID(thisUnitID)
			if (UnitDefs[thisUnitDefID].name ~= "armatlas" 
				and UnitDefs[thisUnitDefID].name ~= "armpeep" 
				and not UnitDefs[thisUnitDefID].cantBeTransported
			) then
				local unitX, unitY, unitZ = Spring.GetUnitPosition(thisUnitID)
				if (unitX > 3100 and unitZ < 5800) then
					if ((unitX - safeAreaCenter.x)^2 + (unitZ - safeAreaCenter.z)^2 > safeAreaRadius^2) then
						return thisUnitID
					end
				end
			end
		end		
	end

	-- no unit found in the north area of the map
	-- take any living outside of safe area then
	for i=1, #listOfUnits do
		local thisUnitID = listOfUnits[i]
		if (not Spring.GetUnitIsDead(thisUnitID)) then
			local thisUnitDefID = Spring.GetUnitDefID(thisUnitID)
			if (UnitDefs[thisUnitDefID].name ~= "armatlas" 
				and UnitDefs[thisUnitDefID].name ~= "armpeep" 
				and not UnitDefs[thisUnitDefID].cantBeTransported
			) then
				local unitX, unitY, unitZ = Spring.GetUnitPosition(thisUnitID)
				if ((unitX - safeAreaCenter.x)^2 + (unitZ - safeAreaCenter.z)^2 > safeAreaRadius^2) then
					return thisUnitID
				end
			end
		end		
	end
end