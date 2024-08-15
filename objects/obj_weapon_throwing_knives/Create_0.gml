///@description			Init
event_inherited()

name = "Throwing Knives"
description = "Throws daggers in an arc. Every 5th dagger deals critical damage."
spawnDistance = 16
baseDamage = 12
spawnObject = obj_dagger
spawnCount = 3

maxCd = 40

stats = [
	new weaponStat(enumWeaponStats.damage, id),
	new weaponStat(enumWeaponStats.knockback, id),
	new weaponStat(enumWeaponStats.projectileCount, id),
	new weaponStat(enumWeaponStats.cooldown, id),
	new weaponStat(enumWeaponStats.critDamage, id)
]

upgrades = [
	obj_wupg_gen_sharpened,
	obj_wupg_gen_hefty,
	obj_wupg_gen_hastened,

	obj_wupg_wh_lit_crits,
]

processUpgrades()

///@description						Returns an array of all projectile(s)
///									that are created
///@return {array<Id.Instance>}
use = function() {
	var _spawnPoint = get_vec2_from_angle_mag(owner.attackAngle, spawnDistance)
	var _totalSpread = 30
	var _spread, _angle, _inst
	var _daggers = []
	
	if (spawnCount > 1) {
		_spread = _totalSpread / (spawnCount - 1)
		_angle = owner.attackAngle - (_totalSpread / 2)
	} else {
		_spread = 0
		_angle = 0
	}
	
	for (var i = 0; i < spawnCount; i++) {
		_inst = instance_create_depth(
			owner.x + _spawnPoint.x,
			owner.y + _spawnPoint.y,
			depths.fx,
			spawnObject
		)
		
		_inst.image_angle = _angle
		_inst.facingAngle = _angle
		_inst.owner = owner
		
		//set_velocity_from_angle(_inst, _angle, random_range(3, 6))
		set_velocity_from_angle(_inst, _angle, 5)
		
		array_push(_daggers, _inst)
		
		_angle += _spread
	}

	audio_play_sound(snd_woosh, 1, false)
	
	return _daggers
}
