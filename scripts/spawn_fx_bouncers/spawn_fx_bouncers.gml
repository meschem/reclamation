///@description										Spawns bouncers
///@param {id.Instance|array<Id.Instance>} _objs	Objects to spawn from
///@param {real} _angle								Angle to apply force from
///@param {real} _magMultiplier						Magnitude multiplier to apply
function spawn_fx_bouncers(_objs, _angle, _magMultiplier = 1) {
	var _inst = noone
	
	if (!is_array(_objs)) {
		_objs = [_objs]
	}
	
	for (var i = 0; i < array_length(_objs); i++) {
		_inst = instance_create_depth(x, y, depths.fx, _objs[i])
		_inst.angleInit = _angle
		_inst.magMultiplier = _magMultiplier
	}
}
