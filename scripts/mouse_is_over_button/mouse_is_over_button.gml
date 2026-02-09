///@description						Checks if a mouse if over a button based on its width and height
///@param {id.Instance} _inst		Instance to check
function mouse_is_over_button(_inst = id) {
	if (
		mouse_x > _inst.x &&
		mouse_y > _inst.y &&
		mouse_x < _inst.x + _inst.buttonWidth &&
		mouse_y < _inst.y + _inst.buttonHeight
	) {
		return true
	}

	return false
}