local sensorInfo = {
	name = "GetLivingAtlas",
}

local EVAL_PERIOD_DEFAULT = -1 -- no caching 

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end

-- @description return a living atlas from a list of units
-- @argument listOfUnits [array of unitIDs] unfiltered list
-- @return living atlas [unitID]
return function(listOfUnits)	
	for i=1, #listOfUnits do
		local thisUnitID = listOfUnits[i]
		if (not Spring.GetUnitIsDead(thisUnitID)) then
			local thisUnitDefID = Spring.GetUnitDefID(thisUnitID)
			if (UnitDefs[thisUnitDefID].name == "armatlas"
				and Spring.GetUnitHealth(thisUnitID) > 0.9) 
			then
				return thisUnitID
			end
		end		
	end

	-- if not atlas with high hp found send any atlas
	for i=1, #listOfUnits do
		local thisUnitID = listOfUnits[i]
		if (not Spring.GetUnitIsDead(thisUnitID)) then
			local thisUnitDefID = Spring.GetUnitDefID(thisUnitID)
			if (UnitDefs[thisUnitDefID].name == "armatlas") then
				return thisUnitID
			end
		end		
	end
end