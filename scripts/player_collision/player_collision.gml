/// @description   Collision code. Must be run by obj_player

function player_collision() {
	if (age - lastHitOn < invulnFrames) {
		image_alpha = (age % 3 = 0) ? 1 : 0
	} else {
		image_alpha = 1

		var hitBy = instance_place(x, y, obj_baddie)

		if (hitBy != noone) {
			if (isCharging) {
				isCharging = false
			
				var xOffset = get_angle_xvel(moveAngle) * 6
				var yOffset = get_angle_yvel(moveAngle) * 6
	
				charge_collision(x + xOffset, y + yOffset, moveAngle, hitBy)
			} else {
				var killed = damage_player(hitBy)
		
				//if (killed) {
				//	show_message("You Died")
				//	game_end()
				//}
			}
		}
	}
}