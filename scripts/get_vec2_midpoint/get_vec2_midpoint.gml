///@description					Gets vec2 midpoint between two vec2's
///@param {struct.vec2} pointA
///@param {struct.vec2} pointB
///@return {struct.vec2}
function get_vec2_midpoint(pointA, pointB) {
	var midX = (pointA.x + pointB.x) / 2
	var midY = (pointA.y + pointB.y) / 2
	
	show_debug_message(midX)
	show_debug_message(midY)
	
	return new vec2(midX, midY)
}