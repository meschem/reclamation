
if (backpack == noone) {
	return 0
}

if (activeSlot) {
	sprite_index = spr_backpack_slot_active
    borderSprite = spr_backpack_slot_inactive_border
} else {
	sprite_index = spr_backpack_slot_inactive
    borderSprite = spr_backpack_slot_active_border
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
    switch (item.rarity) {
        case enumRarity.normal:
            borderImageIndex = 0
            itemImageIndex = 2
        break
    
        case enumRarity.magic:
            borderImageIndex = 1
            itemImageIndex = 3
        break
    
        case enumRarity.rare:
            borderImageIndex = 2
            itemImageIndex = 4
        break
    
        case enumRarity.legendary:
            borderImageIndex = 4
            itemImageIndex = 6
        break
    }
    
	mergeIconActive = backpack.isOpen && item.inValidRecipe
} else {
    borderImageIndex = 0
	mergeIconActive = false
}
