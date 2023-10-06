
function mouse_is_over_button(obj = id) {
	if (
		mouse_x > obj.x &&
		mouse_y > obj.y &&
		mouse_x < obj.x + obj.buttonWidth &&
		mouse_y < obj.y + obj.buttonHeight
	) {
		return true
	}

	return false
}