/// @description Init

enum eliteBuffs {
	tough,
	fast,
	spawner,
	shielding,
}

name = "Unnamed"

hpScalar = 1
moveSpeedScalar = 1
weightScalar = 1

owner = noone
age = 0

depth = depths.enemyFloorFx

activate = function() {
	// defaults to nothing
}

applyScalarsToOwner = function() {
	if (owner == noone) {
		create_toaster("Owner not set on Elite Buff", errorLevels.error)
		return 0
	}
	
	owner.hpMax *= hpScalar
	owner.hp = owner.hpMax
}

//spawnMinions() {
//	var _angle, _dist, _inst
//	var _spawn = new vec2(0, 0)
	
//	for (var i = 0; i < owner.minionCount; i++) {
//		_angle = (360 / owner.minionCount) * i
//		_dist = irandom_range(20, 40)
		
//		_spawn = get_vec2_from_angle_mag(_angle, _dist)
//		_inst = spawn_baddie_at_location(owner.minionType, _spawn.x, _spawn.y)
		
//		_inst.hpMax *= hpScalar
//		_inst.hp = _inst.hpMax
//		_inst.moveSpeedMax *= moveSpeedScalar
//		_inst.weight *= weightScalar
//	}
//}
