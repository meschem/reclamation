///@description						Applies shocked to a target
///@param {id.Instance} _target		Target to apply poison to
///@param {real} _duration			Duration
///@param {id.Instance} _inflictor	Player inflicting poison
function apply_poison(_target, _duration, _inflictor) {
	var _amount = get_player_poison_damage(_inflictor)
	
	if (_amount > _target.poisonStacks) {
		_target.poisonStacks = _amount
	}
	
	if (_duration > _target.poisonLength) {
		_target.poisonLength = _duration
	}
	
	_target.poisonInflictor = _inflictor
}
