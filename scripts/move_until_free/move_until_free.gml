///@description							Moves caller instance until it no longer collides with instances
///@param {real} collisionSearchType	Algorithm used to find a blank space
///@param {real} xSource				X location of source push. Defaults to room center
///@param {real} ySource				Y location of source push. Defaults to room center

function move_until_free(
	collisionSearchType = collisionSearchTypes.linear,
	xSource = (room_width / 2),
	ySource = (room_height / 2)
) {
	//var xTest, yTest
	var sanity = 0
	var pushAngle = point_direction(xSource, ySource, x, y)
	//var searchType = collisionSearchType
	var pushDistance = 2
	var pushAngleStep = 45
	var baseX = x
	var baseY = y
	
	if (collisionSearchType == collisionSearchTypes.radial) {
		pushDistance = 8
		pushAngle = 0
	}
		
	while (place_meeting(x, y, [obj_baddie, obj_solid, obj_pit])) {
		sanity++
	
		if (sanity > 1000) {
			create_toaster("Sanity exceeded for move_until_free(), obj destroyed", errorLevels.error)
			instance_destroy()
			break
		}
		
		
		if (collisionSearchType = collisionSearchTypes.linear) {
			x += get_angle_xvel(pushAngle) * pushDistance
			y += get_angle_yvel(pushAngle) * pushDistance
		} else if (collisionSearchType == collisionSearchTypes.radial) {
			x = baseX
			y = baseY
			
			x += get_angle_xvel(pushAngle) * pushDistance
			y += get_angle_yvel(pushAngle) * pushDistance
			
			pushAngle += pushAngleStep
			
			if (pushAngle >= 360) {
				pushAngle -= 360
				pushDistance += 8
				pushAngleStep = max(pushAngleStep - 4, 2)
			}
		}

		//spawn_fx(x, y, spr_particle_32_circle_boom, 0.5)		
	}
}

enum collisionSearchTypes {
	linear,
	radial
}
