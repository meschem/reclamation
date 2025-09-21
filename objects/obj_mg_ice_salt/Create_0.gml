// Inherit the parent event
event_inherited()

age = 0
name = "Ice Salt"
description = "A fine salt that chills everything it touches."

damage = 10
damageRadius = 150
cooldown = stf(5)

statsSpecial = ["Deals 10 Cold damage to a random nearby enemy every 5 seconds"]

addCharStatBlocks()

onStep = function() {
	if (!equipped) {
		return 0
	}
	
	age++
	
	if (age % cooldown == 0) {
		var _damage = damage
		var _radius = damageRadius
		
		with (owner) {
			damage_baddies_in_area(_radius, _damage, obj_p_shockwave_circle, 1)
		}
	}
}


onEquip = function() {
	age = 0
}
