///@description			Init
event_inherited()

name = "Fire Orb"
description = "Spins in place after hitting a target or traveling a max distance."
spawnDistance = 8
baseDamage = 15
spawnObject = obj_firespit
spawnCount = 1
bonusPoisonDamageScalar = 0
bonusDamageOnBounce = 0

pierceChance = 0

spread = 25
spreadScalar = 1

range = 220
rangeScalar = 1

velocity = 5
velocityScalar = 1

bounces = false
poisons = false

maxCd = 5

stats = [
	new weaponStat(enumWeaponStats.damage, id),
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

	obj_wupg_wh_toxic_cuts,
	obj_wupg_wh_bouncing_mayhem,
	obj_wupg_wh_poison_tipped,
]

processUpgrades()

///@description						Returns an array of all projectile(s)
///									that are created
///@return {array<Id.Instance>}
use = function() {
	var _spawnPoint = get_vec2_from_angle_mag(owner.attackAngle, spawnDistance)
	var _totalSpread = spread * spreadScalar
	var _spread, _angle, _inst
	var _projs = []
	
	if (spawnCount > 1) {
		_spread = _totalSpread / (spawnCount - 1)
		_angle = owner.attackAngle - (_totalSpread / 2)
	} else {
		_spread = _totalSpread
		_angle = owner.attackAngle + (random_sign() * random(_spread / 2))
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
		_inst.bonusPoisonDamageScalar = bonusPoisonDamageScalar
		
		//set_velocity_from_angle(_inst, _angle, random_range(3, 6))
		set_velocity_from_angle(_inst, _angle, velocity * velocityScalar)
		
		array_push(_projs, _inst)
		
		_angle += _spread
	}
	
	if (poisons) {
		//var _index = irandom(array_length(_daggers) - 1)
		
		//with (_daggers[_index]) {
		//	sprite_index = spr_dagger_poisoned
		//	trailColor = get_color(colors.green)
		//	poisons = true
		//}
	}

	//audio_play_sound(snd_woosh, 1, false)
	
	return _projs
}
