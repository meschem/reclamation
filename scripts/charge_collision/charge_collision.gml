/// @description			Description
/// @param {real}			xPos		Position to create AOE
/// @param {real}			yPos		Position to create AOE
/// @param {real}			angle		Angle of collision
/// @param {id.Instance}	target		Target to deal direct damage to

function charge_collision(xPos, yPos, angle, target = noone) {
	var directDamage = obj_ability_charge.damage
	var stunLength = obj_ability_charge.stunLength
	var knockback = obj_ability_charge.knockback
	var isCrit = false
	
	spawn_fx_shock_boom(xPos, yPos)
	
	buff_player_invuln(2.5)

	if (target != noone) {
		knockback_baddie(target, knockback, angle)
		stun_baddie(target, stunLength)
		
		if (obj_ability_charge.runes[enumRunes.voldan].enabled) {
			var halvingDamage = min(target.hp * 0.5, obj_ability_charge.maxHalvingDamage)
			
			directDamage = max(directDamage, halvingDamage)
			isCrit = true
		}
		
		damage_baddie(target, directDamage, isCrit)
				
		if (obj_player.chargeShockFrames > 0) {
			var shockDamage = obj_ability_charge.getShockDamage(chargeShockFrames)
			
			damage_baddies_in_area(obj_ability_charge.shockRadius, shockDamage)
		}
	}
}