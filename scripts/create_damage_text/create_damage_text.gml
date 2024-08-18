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
			obj_moving_text
		)
		
		//inst.yVel = -2
		_inst.xVel = random_range(-0.5, 0.5)
		
		var _displayAmount = round(_amount)
		
		if (_style == damageTextStyles.crit) {
			_inst.displayText = string(round(_displayAmount)) + "!"
			_inst.fontColor = get_color(colors.orange)
		} else if (_style == damageTextStyles.poison) {
			_inst.displayText = string(round(_displayAmount))
			_inst.fontColor = get_color(colors.green)
		} else {
			_inst.displayText = string(round(_displayAmount))
		}
}
