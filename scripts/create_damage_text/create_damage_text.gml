///@description					Creates moving text using damage styles
///@param {real} _x
///@param {real} _y
///@param {real} _amount
///@param {real} _style			Uses enum damageTextStyles
function create_damage_text(_x, _y, _amount, _style) {
	var _inst = instance_create_depth(
			_x + irandom_range(-5, 5),
			_y + irandom_range(-5, 5),
			depths.ui,
			obj_dmg_numbers
		)
		
		//inst.yVel = -2
		_inst.xVel = random_range(-0.5, 0.5)
		
		var _displayAmount = round(_amount)
		
		if (_style == damageTextStyles.crit) {
			_inst.setValue(_displayAmount, true)
		} else if (_style == damageTextStyles.poison) {
			_inst.setValue(_displayAmount)
			_inst.image_blend = get_color(colors.green)
		} else {
			_inst.setValue(_displayAmount)
		}
}
