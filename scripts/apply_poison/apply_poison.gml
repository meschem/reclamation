///@description						Applies shocked to a target
///@param {id.Instance} _target		Target to apply poison to
///@param {real} _amount			Amount to apply
///@param {real} _duration			Duration
///@param {id.Instance} _inflictor	Player inflicting poison
function apply_poison(_target, _amount, _duration, _inflictor) {
	if (_amount > _target.poisonStacks) {
		_target.poisonStacks = _amount
	}
	
	if (_duration > _target.poisonLength) {
		_target.poisonLength = _duration
	}
	
	_target.poisonInflictor = _inflictor
}
