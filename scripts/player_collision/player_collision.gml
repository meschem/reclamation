/// @description   Collision code. Must be run by obj_player

function player_collision() {
	if (age - lastHitOn < invulnFrames) {
		image_alpha = (age % 3 = 0) ? 1 : 0
	} else {
		image_alpha = 1

		var hitByList = ds_list_create()
		var length = instance_place_list(x, y, obj_baddie, hitByList, true)
		var hitBy = noone
		
		if (length > 0) {
			for (var i = 0; i < length; i++) {
				if (place_meeting(x, y, hitByList[| i])) {
					hitBy = hitByList[| i]
				}
			}
		}

		if (hitBy != noone) {
			if (isCharging) {
				isCharging = false
			
				var xOffset = get_angle_xvel(moveAngle) * 6
				var yOffset = get_angle_yvel(moveAngle) * 6
	
				charge_collision(x + xOffset, y + yOffset, moveAngle, hitBy)
			} else {
				var killed = damage_player(hitBy)
			}
		}
	}
}
