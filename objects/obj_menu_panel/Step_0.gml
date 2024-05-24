/// @description Insert description here
// You can write your code in this editor

if (!instance_exists(menu)) {
	instance_destroy()
	return 0
}

image_xscale = width / sprite_get_width(sprite_index)
image_yscale = height / sprite_get_height(sprite_index)

if (menu != noone) {
	depth = menu.depth - 1
}

image_index = state
