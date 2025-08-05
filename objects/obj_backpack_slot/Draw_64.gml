/// @description Insert description here
// You can write your code in this editor

//if (backpack.isOpen) {
//	draw_sprite_ext(
//		sprite_index,
//		image_index,
//		drawPos.x,
//		drawPos.y,
//		image_xscale,
//		image_yscale,
//		image_angle,
//		image_blend,
//		image_alpha
//	)
//} else {

//}

draw_self()

if (item != noone && !instance_exists(item)) {
	show_message([id, x, y])
	item = noone
	sprite_index = spr_abil_select_icon_thorns
}


if (item != noone && image_alpha != 0) {
	draw_sprite(
		item.sprite_index,
		1,
		x + itemPadding,
		y + itemPadding
	)
}
