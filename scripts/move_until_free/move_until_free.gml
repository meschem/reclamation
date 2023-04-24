///@description					Moves caller instance until it no longer collides with instances
///@param {real} xSource		X location of source push. Defaults to room center.
///@param {real} ySource		Y location of source push. Defaults to room center.

function move_until_free(
	xSource = (room_width / 2),
	ySource = (room_height / 2)
) {
	var xTest, yTest
	var sanity = 0
	var pushAngle = point_direction(xSource, ySource, x, y)
	
	while (place_meeting(x, y, obj_baddie)) {
		sanity++
	
		if (sanity > 1000) {
			show_error("Sanity exceeded for move_until_free()", true)
		}
		
		// PERFCHECK
		x += get_angle_xvel(pushAngle)
		y += get_angle_yvel(pushAngle)
	}
}