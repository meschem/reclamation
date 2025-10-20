// Inherit the parent event
event_inherited()

age = 0
name = "Ice Salt"
description = "A fine salt that chills everything it touches."

damage = 10
damageRadius = 60
slowDuration = stf(2)
cooldown = stf(5)

statsSpecial = ["Deals 10 Cold damage to a random nearby enemy every 5 seconds"]

//addCharStatBlocks()

onStep = function() {
	if (!equipped) {
		return 0
	}
	
	age++
	
	if (age % cooldown == 0) {
		var _radius = damageRadius * get_player_stat(enumPlayerStats.areaOfEffectScalar)
		var _baddie = get_random_baddie_in_area(_radius, owner.x, owner.y)
		
		if (_baddie != noone) {
			damage_baddie_with_type(_baddie, damage, enumDamageTypes.cold, owner)
			apply_slow(_baddie, slowDuration)
		}
	}
}

onEquip = function() {
	age = 0
}
