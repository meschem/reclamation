// Inherit the parent event
event_inherited()

age = 0
name = "Fire Salt"
description = "A flaky salt that exhudes an intense heat under the right conditions."

damage = 15
damageRadius = 90

var cdSeconds = 3
cooldown = stf(cdSeconds)
cdAge = floor(random(1) * cooldown)

var statsString = $"Deals {damage} Fire Damage to a random nearby enemy every {cdSeconds} seconds"

statsSpecial = [statsString]

onStep = function() {
	if (!equipped) {
		return 0
	}
	
	cdAge++
	
	if (cdAge % cooldown == 0) {
		var _radius = damageRadius * get_player_stat(enumPlayerStats.areaOfEffectScalar)
		var _baddie = get_random_baddie_in_area(_radius, owner.x, owner.y)
		
		if (_baddie != noone) {
			damage_baddie_with_type(_baddie, damage, enumDamageTypes.fire)
		
			var _particle = instance_create_depth(_baddie.x, _baddie.y, depths.fx, obj_particle_single_cycle)
			_particle.sprite_index = spr_flare_up
			
			var _particle = instance_create_depth(_baddie.x, _baddie.y, depths.fx, obj_particle_single_cycle)
			_particle.sprite_index = spr_flare_up_outline
			_particle.image_blend = global.colorYellow
		}
	}
}
