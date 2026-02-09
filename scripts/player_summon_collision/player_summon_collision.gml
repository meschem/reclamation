/// @description   Collision code. Must be run by obj_player_summon

function player_summon_collision() {	
	if (age - lastHitOn < invulnFrames) {
		image_alpha = (age % 3 = 0) ? 1 : 0
	} else {
		image_alpha = 1

		var hitBy = instance_place(x, y, obj_baddie)

		if (hitBy != noone) {
			lastHitOn = age

			hp -= hitBy.damageOnHit
			
			if (returnKnockback > 0) {
				knockback_baddie(
					hitBy,
					returnKnockback,
					point_direction(x, y, hitBy.x, hitBy.y)
				)
			}
			
			if (returnDamage > 0) {
				damage_baddie(hitBy, returnDamage)
			}
		}
	}
}
