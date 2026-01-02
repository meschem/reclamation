

if (!obj_ui_controller.drawBackpackSlots || obj_ui_controller.skipPlayerUi || image_alpha == 0) {
	return 0
}

draw_self()

draw_sprite(
    borderSprite,
    borderImageIndex,
    x, y
)

if (item != noone && !instance_exists(item)) {
	show_message([id, x, y])
	item = noone
	sprite_index = spr_abil_select_icon_thorns
}

if (item != noone) {
    draw_sprite(
        item.sprite_index,
        itemImageIndex,
        x + itemPadding,
        y + itemPadding + 1
    )
}
