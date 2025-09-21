///@description						Gets a generic type of input
///@param {real} _bindAction		Uses enum bindActions to check against
///@param {real} _pressType			Uses enum pressType for down, release, or hold
///@return {bool}
function get_input(_bindAction, _pressType = pressType.down) {
	var _ctrl = obj_input_controller
	
	if (_pressType == pressType.down) {
		if (_bindAction == bindActions.down) {
			if (
				keyboard_check_pressed(_ctrl.bindDown.keyboard) ||
				gamepad_button_check_pressed(0, _ctrl.bindDown.controller)
			) {
				return true
			}
		}
		
		if (_bindAction == bindActions.right) {
			if (
				keyboard_check_pressed(_ctrl.bindRight.keyboard) ||
				gamepad_button_check_pressed(0, _ctrl.bindRight.controller)
			) {
				return true
			}
		}
		
		if (_bindAction == bindActions.up) {
			if (
				keyboard_check_pressed(_ctrl.bindUp.keyboard) ||
				gamepad_button_check_pressed(0, _ctrl.bindUp.controller)
			) {
				return true
			}
		}
		
		if (_bindAction == bindActions.left) {
			if (
				keyboard_check_pressed(_ctrl.bindLeft.keyboard) ||
				gamepad_button_check_pressed(0, _ctrl.bindLeft.controller)
			) {
				return true
			}
		}
		
		if (_bindAction == bindActions.confirm) {
			if (
				keyboard_check_pressed(_ctrl.bindConfirm.keyboard) ||
				gamepad_button_check_pressed(0, _ctrl.bindConfirm.controller)
			) {
				return true
			}
		}
		
		if (_bindAction == bindActions.back) {
			if (
				keyboard_check_pressed(_ctrl.bindBack.keyboard) ||
				gamepad_button_check_pressed(0, _ctrl.bindBack.controller)
			) {
				return true
			}
		}
	}
	
	return false
}