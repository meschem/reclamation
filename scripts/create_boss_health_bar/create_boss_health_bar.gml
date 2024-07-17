///@description						Creates a boss health bar
///@param {id.Instance} _baddie		Baddie to use
function create_boss_health_bar(_baddie) {
	if (_baddie.hpBarInst == noone) {
		instance_destroy(_baddie.hpBarInst)
	}
	
	var _inst = instance_create_depth(
		-99, -99, depths.ui, obj_hp_bar_boss
	)
	
	_inst.baddie = _baddie
	_inst.hpBarInst = _inst
}

///@description						Creates an elite health bar
///@param {id.Instance} _baddie		Baddie to use
function create_elite_health_bar(_baddie) {
	if (_baddie.hpBarInst == noone) {
		instance_destroy(_baddie.hpBarInst)
	}
	
	var _inst = instance_create_depth(
		-99, -99, depths.ui, obj_hp_bar_elite
	)
	
	_inst.baddie = _baddie
	_inst.hpBarInst = _inst
}
