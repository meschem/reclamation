///@description			Init
event_inherited()

name = "Throwing Knives"
description = "Throws daggers in an arc. Every 5th dagger deals critical damage."
spawnDistance = 16
spawnObject = obj_dagger
spawnCount = 3

maxCd = 30

stats = [
	new abilityStat(
		"Damage", "damage",
		[6]
	),
	new abilityStat(
		"Cooldown", "maxCd",
		[30]
	),
	new abilityStat(
		"Range", "range",
		[180], true,
		statUnits.length
	)
]

reverseSwipe = false

upgrades = [
	create_instance(obj_wupg_wh_mega_hammer),
	create_instance(obj_wupg_gen_attack_speed),
]

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
