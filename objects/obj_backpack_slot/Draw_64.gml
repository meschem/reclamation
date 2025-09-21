

if (obj_ui_controller.skipPlayerUi || image_alpha == 0) {
	return 0
}

draw_self()

if (item != noone && !instance_exists(item)) {
	show_message([id, x, y])
	item = noone
	sprite_index = spr_abil_select_icon_thorns
}

if (item != noone) {
	draw_sprite(
		item.sprite_index,
		1,
		x + itemPadding,
		y + itemPadding + 1
	)
}
