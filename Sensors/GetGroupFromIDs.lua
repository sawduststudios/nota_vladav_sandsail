local sensorInfo = {
	name = "GetGroupFromIDs",
}

local EVAL_PERIOD_DEFAULT = -1 -- no caching 

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end

-- @description return the group of all available warriors
return function(warriorIds)	
	local group = {}
	for i, id in ipairs(warriorIds) do
		group[id] = i
	end

	return group
end