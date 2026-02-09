// Inherit the parent event
event_inherited()

age = 0
name = "Cinder Stone"
description = "Pretty hot."

damage = 12

var statsString = $"Adds {damage} Fire Damage to weapon attacks"
statsSpecial = [statsString]

onWeaponHit = function(_data) {
	if (!equipped) {
		return 0
	}
	
	if (!instance_exists(_data.target)) {
		return 0
	}
	
	//var _damage = damage * get_player_stat(enumPlayerStats.abilityDamageScalar)
	damage_baddie_with_type(_data.target, damage, enumDamageTypes.fire, owner)
	
	var _particle = instance_create_depth(_data.target.x, _data.target.y, depths.fx, obj_particle_single_cycle)
	_particle.sprite_index = spr_flare_up
}

//damageRadius = 100
//collisionList = ds_list_create()

//var cdSeconds = 5
//cooldown = stf(cdSeconds)
//cdAge = floor(random(1) * cooldown)

//var statsString = $"Deals {damage} in a large area every {cdSeconds} seconds"

//statsSpecial = [statsString]

//onStep = function() {
//	if (!equipped) {
//		return 0
//	}
	
//	cdAge++
	
//	if (cdAge % cooldown == 0) {
//		var _radius = damageRadius * get_player_stat(enumPlayerStats.areaOfEffectScalar)
//		var _baddies = collision_circle_list(owner.x, owner.y, damageRadius, obj_baddie, false, true, collisionList, false)
//	}
//}
