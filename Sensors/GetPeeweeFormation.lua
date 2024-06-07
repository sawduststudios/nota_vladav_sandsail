local sensorInfo = {
	name = "GetPeeweeFormation",
}

local EVAL_PERIOD_DEFAULT = -1 -- no caching 

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end

-- @description return formation of 3 warriors
return function()	
	return {Vec3(1365,192,309), Vec3(1934,192,834), Vec3(2584,192,372)}
end