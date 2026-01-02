// Inherit the parent event
event_inherited()

age = 0
name = "Ice Salt"
description = "A fine salt that chills everything it touches."

damage = [10, 15, 20]
damageRadius = [60, 60, 60]
slowDuration = stf(2)
cooldown = [stf(5), stf(2.5), stf(1)]

maxLevel = 3

stats = [
    create_custom_item_stat(damage, "Damage"),
    create_custom_item_stat(damageRadius, "Radius"),
    create_custom_item_stat(cooldown, "Cooldown", statUnits.frames)
]

statsSpecial = ["Periodically deals cold damage to nearby enemies"]

onStep = function() {
	if (!equipped) {
		return 0
	}
	
	age++
    
    var _index = min(level - 1, array_length(damage) - 1)
	
	if (age % cooldown[_index] == 0) {
		var _radius = damageRadius[_index] * get_player_stat(enumPlayerStats.areaOfEffectScalar)
		var _baddie = get_random_baddie_in_area(_radius, owner.x, owner.y)
		
		if (_baddie != noone) {
			damage_baddie_with_type(_baddie, damage[_index], enumDamageTypes.cold, owner)
			apply_slow(_baddie, slowDuration)
		}
	}
}

onEquip = function() {
	age = 0
}
