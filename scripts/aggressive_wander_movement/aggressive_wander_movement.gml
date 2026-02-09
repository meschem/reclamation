///@description			Movement for summons. Makes many assumptions on instanced variables
function aggressive_wander_movement() {
	if (age % acquireTargetRate == 0) {
		target = instance_nearest(x, y, obj_baddie)
		
		if (target != noone) {
			//create_toaster($"New Target: {target.name}")
		}
	}
	
	if (target != noone && !instance_exists(target)) {
		target = noone
	}
	
	if (target == noone) {
		if (age % stf(6) == 0) {
			var _distance = random_range(wanderDistanceMin, wanderDistanceMax)
			var _angle = random(360)

			moveTarget = get_vec2_from_angle_mag(_angle, _distance)
			moveTarget.x = owner.x + moveTarget.x
			moveTarget.y = owner.y + moveTarget.y
			
			//instance_create_depth(moveTarget.x, moveTarget.y, depths.player, obj_debug_vis)
		}
	} else if (age % distanceCheckRate == 0) {
		var _distance = point_distance(x, y, target.x, target.y)
		
		
		
		if (_distance > distanceToTargetMax || _distance < distanceToTargetMin) {
			var _angle = point_direction(target.x, target.y, x, y)
			
			moveTarget = get_vec2_from_angle_mag(_angle, distanceToTargetOptimal)
			moveTarget.x += target.x
			moveTarget.y += target.y
		
		}

		//instance_create_depth(moveTarget.x, moveTarget.y, depths.player, obj_debug_vis)
	}
	
	var _distance = point_distance(x, y, moveTarget.x, moveTarget.y)
	
	if (_distance > moveTargetCushion) {
		var _mag = point_distance(0, 0, xVel, yVel)
		var _angle = point_direction(x, y, moveTarget.x, moveTarget.y)
		
		_mag = min(_mag + accel, moveSpeedMax)
		
		var _moveVec = get_vec2_from_angle_mag(_angle, _mag)
		
		//show_message($"{_angle}, {_distance}, {moveTargetCushion}")
		
		xVel = _moveVec.x
		yVel = _moveVec.y
	} else {
		xVel = 0
		yVel = 0
	}
}