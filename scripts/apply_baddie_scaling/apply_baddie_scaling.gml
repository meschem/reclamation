///@description						Applies run scaling to a baddie
///@param {Id.Instance | array<Id.Instance>}
function apply_baddie_scaling(_baddies) {
	if (!is_array(_baddies)) {
		_baddies = [_baddies]
	}
	
	for (var i = 0; i < array_length(_baddies); i++) {
		_baddies[i].hpMax *= obj_run_controller.getBaddieScaling(baddieScalars.hp)
		_baddies[i].hp = _baddies[i].hpMax
		_baddies[i].moveSpeedMax *= obj_run_controller.getBaddieScaling(baddieScalars.moveSpeed)
	}
}
