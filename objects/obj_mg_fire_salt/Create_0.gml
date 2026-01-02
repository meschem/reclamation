// Inherit the parent event
event_inherited()

age = 0
name = "Fire Salt"
description = "A flaky salt that exhudes an intense heat under the right conditions."

damage = [15, 30, 80]
damageRadius = 90
cooldown = stf(3)
cdAge = floor(random(1) * cooldown)

stats = [
    create_custom_item_stat(damage, "Damage")
]

var statsString = "Periodically deals Fire damage to nearby enemies"

statsSpecial = [statsString]

onStep = function() {
	if (!equipped) {
		return 0
	}
	
	cdAge++
	
	if (cdAge % cooldown == 0) {
		var _radius = damageRadius * get_player_stat(enumPlayerStats.areaOfEffectScalar)
		var _baddie = get_random_baddie_in_area(_radius, owner.x, owner.y)
        var _index = min(level - 1, array_length(damage) - 1)
		
		if (_baddie != noone) {
			damage_baddie_with_type(_baddie, damage[_index], enumDamageTypes.fire)
		
			var _particle = instance_create_depth(_baddie.x, _baddie.y, depths.fx, obj_particle_single_cycle)
			_particle.sprite_index = spr_flare_up
			
			_particle = instance_create_depth(_baddie.x, _baddie.y, depths.fx, obj_particle_single_cycle)
			_particle.sprite_index = spr_flare_up_outline
			_particle.image_blend = global.colorYellow
		}
	}
}
