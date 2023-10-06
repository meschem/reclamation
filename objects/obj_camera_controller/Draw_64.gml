/// @description Insert description here
// You can write your code in this editor

draw_set_alpha(0.4)
draw_set_color(c_purple)

draw_rectangle(
	getCenterX() - focusObjectBoundsX,
	getCenterY() - focusObjectBoundsY,
	getCenterX() + focusObjectBoundsX,
	getCenterY() + focusObjectBoundsY,
	false
)

draw_set_alpha(1)
draw_set_color(c_green)

draw_circle(
	camera_get_view_x(view_camera[0]),
	camera_get_view_y(view_camera[0]),
	10, false
)

draw_circle(
	getCenterX(),
	getCenterY(),
	5, false
)

draw_set_alpha(1)
draw_set_color(c_white)
