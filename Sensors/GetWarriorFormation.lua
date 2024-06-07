local sensorInfo = {
	name = "GetWarriorFormation",
}

local EVAL_PERIOD_DEFAULT = -1 -- no caching 

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end

-- @description return formation of 3 warriors
return function()	
	return {Vec3(0,0,-20), Vec3(0,0,0), Vec3(0,0,20)}
end