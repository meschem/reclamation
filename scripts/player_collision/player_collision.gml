/// @description   Collision code. Must be run by obj_player

function player_collision() {
	// FIXME: Should not be in here
	if (age - lastHitOn < invulnFrames) {
		image_alpha = (age % 3 = 0) ? 1 : 0
		
		return
	}
	
	image_alpha = 1

	var hitByList = ds_list_create()
	var baddieHitList = instance_place_list(x, y, [obj_baddie, obj_enemy_projectile, obj_damage_aoe], hitByList, true)
	var confirmedHitList = []
	
	// Checks collision with player coordinates with enemy bbox
	for (var i = 0; i < baddieHitList; i++) {
		if (place_meeting(x, y, hitByList[| i])) {
			array_push(confirmedHitList, hitByList[| i])
		}
	}
	
	// Destroys projectile on collision
	for (var i = 0; i < array_length(confirmedHitList); i++) {
		if (object_is_ancestor(confirmedHitList[i].object_index, obj_projectile)) {
			// instance_destroy(confirmedHitList[i])
			
			confirmedHitList[i].markForDestroy = true
		}
	}	
	
	if (isCharging) {
		var _target = noone

		for (var i = 0; i < array_length(confirmedHitList); i++) {
			
			_target = confirmedHitList[i]
			
			if (!object_is_ancestor(_target.object_index, obj_projectile) &&
			    !object_is_ancestor(_target.object_index, obj_damage_aoe)) {
					
				var _ability = get_ability_instance(id, obj_ability_charge)
					
				if (keyboard_check(ord("R"))) {
					_ability.collision(_target)
				} else {
					isCharging = false
					_ability.finalCollision(_target)

					//var xOffset = get_angle_xvel(moveAngle) * 6
					//var yOffset = get_angle_yvel(moveAngle) * 6
					//charge_collision(x + xOffset, y + yOffset, moveAngle, confirmedHitList[i])
			
					break
				}
			}
		}
		
		return
	}
	
	if (array_length(confirmedHitList) > 0) {
		damage_player(confirmedHitList[0])
	}
}
