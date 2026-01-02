///@description			Init
event_inherited()

name = "Zock Ice"
description = "Fires multiple projectiles in a spread."
spawnDistance = 16
baseDamage = 10
spawnObject = obj_zock_ice
spawnCount = 3
bonusPoisonDamageScalar = 0
bonusDamageOnBounce = 0

pierceChance = 0

spread = 50
spreadScalar = 1

range = 300
rangeScalar = 1

velocity = 5
velocityMin = 3.5
velocityMax = 4.1
velocityScalar = 1

bounces = true

maxCd = 45

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

	obj_wupg_td_toxic_cuts,
	obj_wupg_td_bouncing_mayhem,
	obj_wupg_td_poison_tipped,
]

processUpgrades()

///@description						Returns an array of all projectile(s)
///									that are created
///@return {array<Id.Instance>}
use = function() {
	var _spawnPoint = get_vec2_from_angle_mag(owner.attackAngle, spawnDistance)
	var _totalSpread = spread * spreadScalar
	var _spread, _angle, _inst
	var _daggers = []
	
	for (var i = 0; i < spawnCount; i++) {
		_inst = instance_create_depth(
			owner.x + _spawnPoint.x,
			owner.y + _spawnPoint.y,
			depths.fx,
			spawnObject
		)
		
		_inst.image_angle = random(360)
		_inst.owner = owner
		_inst.distanceMax = range * rangeScalar
		_inst.bouncesMax = (bounces) ? 5 : 0
		_inst.bonusDamageOnBounce = bonusDamageOnBounce
		_inst.distanceMax = range
		
		var _velocity = random_range(velocityMin, velocityMax)
		
		_angle = owner.attackAngle + random_range(-_totalSpread / 2, _totalSpread / 2)
		
		set_velocity_from_angle(_inst, _angle, _velocity * velocityScalar)
		
		array_push(_daggers, _inst)

	}


	audio_play_sound(snd_woosh, 1, false)
	
	return _daggers
}
