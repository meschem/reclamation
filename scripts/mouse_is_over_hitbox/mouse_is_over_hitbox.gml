///@description						Checks if the mouse is over an objects hitbox
///@param {Id.Instance} inst		Instance to check. Defaults to self.
function mouse_is_over_hitbox(inst = noone) {
	if (inst == noone) {
		inst = id
	}
	
	var camOffsetX = camera_get_view_x(view_camera[0])
	var camOffsetY = camera_get_view_y(view_camera[0])
	
	var isOver = (
		mouse_x > inst.bbox_left + camOffsetX &&
		mouse_x < inst.bbox_right + camOffsetX &&
		mouse_y > inst.bbox_top + camOffsetY &&
		mouse_y < inst.bbox_bottom + camOffsetY
	)
	
	return isOver
}
