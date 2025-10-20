///@description						Applies shocked to a target
///@param {id.Instance} _target		Target to apply slow to
///@param {real} _duration			Duration in frames
function apply_slow(_target, _duration) {
	if (_duration > _target.slowLength) {
		_target.slowLength = _duration
	}
}
