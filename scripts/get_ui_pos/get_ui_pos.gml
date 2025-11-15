///@description					Gets the position of an object relative to the camera for Draw GUI events
///@param {id.Instance} inst	Instance to get position of
///@return {struct.vec2}
function get_ui_pos(inst = id) {
	var pos = new vec2()
	var cam = view_camera[0]
	
	pos.x = inst.x - camera_get_view_x(cam)
	pos.y = inst.y - camera_get_view_y(cam)
	
	return pos
}