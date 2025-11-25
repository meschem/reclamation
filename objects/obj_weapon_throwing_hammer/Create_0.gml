///@description			Init
event_inherited()

name = "Throwing Hammer"
description = "For those determined to stick with hammers in any situation."
spawnDistance = 16
baseDamage = 10
spawnObject = obj_war_hammer
spawnCount = 1

damageStatBoostStr = 0.5
damageStatBoostDex = 0.5

baseKnockback = 10

pierceChance = 0

spread = 20
spreadScalar = 1

range = 240
rangeScalar = 1

velocity = 5
velocityScalar = 1

maxCd = 60

stats = [
	new weaponStat(enumWeaponStats.damage, id),
	new weaponStat(enumWeaponStats.knockback, id),
	new weaponStat(enumWeaponStats.projectileCount, id),
	new weaponStat(enumWeaponStats.cooldown, id),
	new weaponStat(enumWeaponStats.critDamage, id),
	new weaponStat(enumWeaponStats.projectileSpread, id)
]

upgrades = [
	obj_wupg_gen_sharpened,
	obj_wupg_gen_hefty,
	obj_wupg_gen_hastened,
	obj_wupg_gen_pierced,
	obj_wupg_gen_focused,
	obj_wupg_gen_contoured,
	obj_wupg_gen_multiplied,
]

processUpgrades()

///@description						Returns an array of all projectile(s)
///									that are created
///@return {array<Id.Instance>}
use = function() {
	var _spawnPoint = get_vec2_from_angle_mag(owner.attackAngle, spawnDistance)
	var _totalSpread = spread * spreadScalar
	var _spread, _angle, _inst
	var _hammers = []
	
	if (spawnCount > 1) {
		_spread = _totalSpread / (spawnCount - 1)
		_angle = owner.attackAngle - (_totalSpread / 2)
	} else {
		_spread = 0
		_angle = owner.attackAngle
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
		_inst.distanceMax = range * rangeScalar
		_inst.pierceChance = pierceChance
		_inst.damager = id
		
		set_velocity_from_angle(_inst, _angle, velocity * velocityScalar)
		
		array_push(_hammers, _inst)
		
		_angle += _spread
	}
	
	var _pCount = 6
	var _pVariance = 4
	var _pSpread = 40
	var _angleDelta = _pSpread / _pCount
	_angle = owner.attackAngle
	
	for (var i = 0; i < _pCount; i++) {
		var _pMag = random_range(0.2, 1.3)		
		var _pAngle = _angle - (_pSpread / 2) + (i * _angleDelta)
		
		_pAngle = random_range(_pAngle - _pVariance, _pAngle + _pVariance)

		_inst = instance_create_depth(
			owner.x + _spawnPoint.x,
			owner.y + _spawnPoint.y,
			depths.fx,
			obj_particle_line_sm
		)
		
		_inst.xVel = angle_xvel(_pAngle) * _pMag
		_inst.yVel = angle_yvel(_pAngle) * _pMag
		_inst.image_speed = irandom_range(0.4, 1)
		_inst.image_angle = _pAngle
	}
	
	var _gain = random_range(0.9, 1.1)
	var _pitch = random_range(0.9, 1.1)

	audio_play_sound(snd_throw_quick_slower, 1, false, _gain, 0, _pitch)
	
	return _hammers
}
