
if (backpack == noone) {
	return 0
}

if (activeSlot) {
	sprite_index = spr_backpack_slot_active
} else {
	sprite_index = spr_backpack_slot_inactive
}

if (get_ui_profile_type() == uiProfileTypes.minimal) {
	image_alpha = 0
} else if (backpack.isOpen || backpack.simpleDisplay) {
	x = xOffset + backpack.x
	y = yOffset + backpack.y
	image_alpha = 1
} else {
	x = xOffset - 12
	y = yOffset + backpack.y
	image_alpha = (activeSlot) ? 1 : 0
}

if (item != noone && !instance_exists(item)) {
	item = noone
	create_toaster("Item removed by slot", errorLevels.error)
	return 0
}

if (item != noone) {
	mergeIconActive = backpack.isOpen && item.inValidRecipe
} else {
	mergeIconActive = false
}
