local sensorInfo = {
	name = "ReverseTable",
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
return function(tab)
	local reversed = {}
	
	for k, v in pairs(tab) do
      reversed[v] = k
    end
	
	return reversed
end