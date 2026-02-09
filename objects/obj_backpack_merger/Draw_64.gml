
if (image_alpha == 0) {
	return 0
}

// draw bg
draw_sprite_ext(
	sprite_index, 0,
	x, y,
	image_xscale, image_yscale,
	image_angle, image_blend, image_alpha
)

// draw title text
draw_sprite(
	combiningTextSpr, 0,
	x + combiningTextOffset.x,
	y + combiningTextOffset.y
)

// draw plusses
for (var i = 0; i < array_length(iconPlusses); i++) {
	if (iconPlusses[i].draw) {
		draw_sprite(
			iconPlusses[i].spriteIndex,
			iconPlusses[i].imageIndex, 
			x + iconPlusses[i].offset.x,
			y + iconPlusses[i].offset.y
		)
	}
}

// draw pedestals
for (var i = 0; i < array_length(itemPedestals); i++) {
	if (itemPedestals[i].draw) {
		draw_sprite(
			itemPedestals[i].spriteIndex,
			itemPedestals[i].imageIndex, 
			x + itemPedestals[i].offset.x,
			y + itemPedestals[i].offset.y
		)
	}
}

// draw items
for (var i = 0; i < array_length(mergingItems); i++) {
	draw_sprite(
		mergingItems[i].sprite_index,
		2 + mergingItems[i].rarity, 
		x + itemPedestals[i].offset.x - 1,
		y + itemPedestals[i].offset.y - mergingItems[i].sprite_height + 7
	)
}

// draw merge icon
draw_sprite(
	mergeIcon,
	mergeIconImageIndex,
	x + mergeIconOffset.x,
	y + mergeIconOffset.y
)

// draw result slot and item
draw_sprite(
	combineSlotSprite,
	combineSlotIndex,
	x + combineSlotOffset.x,
	y + combineSlotOffset.y
)

draw_sprite(
	combineSlotItemSprite,
	combineSlotItemImageIndex,
	x + combineSlotOffset.x + 3,
	y + combineSlotOffset.y + 3
)

// draw merge input
if (mergeInputDraw) {
	draw_sprite(
		mergeInputIcon, 0,
		x + mergeInputOffset.x,
		y + mergeInputOffset.y
	)
	
	draw_sprite(
		mergeInputText, 0,
		x + mergeInputOffset.x + sprite_get_width(mergeInputIcon) - 1,
		y + mergeInputOffset.y + 2
	)
}
