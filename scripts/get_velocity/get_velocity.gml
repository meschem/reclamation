///@description   Description
///@return {real}

function get_velocity(obj = id){
	return point_distance(0, 0, id.xVel, id.yVel)
}