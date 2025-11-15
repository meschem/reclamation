
if (!active) {
	return 0
}

var _cam = view_camera[0]
var _vx = camera_get_view_x(_cam)
var _vy = camera_get_view_y(_cam)

var _px = 0 
var _py = 0 
var _pw = window_get_width() 
var _ph = window_get_height()

if (!surface_exists(surfaceMirror)) {
	show_message("surf mirror does not exist")
	return 0
}

var _alpha = 0.5
var _color = c_aqua

//draw_surface_stretched_ext(
//	surfaceMirror, 0, 0, _pw, _ph, _color, _alpha
//)

draw_surface_ext(surfaceMirror, _vx, _vy, 1, 1, 0, _color, _alpha)
