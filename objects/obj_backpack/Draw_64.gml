/// @description Insert description here
// You can write your code in this editor

draw_self()

draw_sprite_ext(
	spr_backpack_window_active_area,
	0,
	x + padding.left,
	y + padding.top + activeTitleHeight - 6,
	5.56, 8.56,
	0,
	c_white,
	image_alpha
)

draw_sprite_ext(
	spr_backpack_text_active,
	0,
	x + padding.left + 13,
	y + padding.top,
	1, 1, 0,
	c_white,
	image_alpha
)
