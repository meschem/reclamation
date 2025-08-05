/// @description Insert description here
// You can write your code in this editor

//show_message($"{activeSlot}: ({x}, {y})")

if (activeSlot) {
	sprite_index = spr_backpack_slot_active
} else {
	sprite_index = spr_backpack_slot_inactive
}

if (backpack.isOpen) {
	x = xOffset + backpack.x
	y = yOffset + backpack.y
	image_alpha = 1
} else {
	x = xOffset - 12
	y = yOffset + backpack.y
	image_alpha = (activeSlot) ? 1 : 0
}

try {
	//drawPos.x = backpack.x + x
	//drawPos.y = backpack.y + y
} catch (err) {
	show_message(instance_number(obj_backpack))
	show_message([backpack, err])
}

if (item != noone && !instance_exists(item)) {
	item = noone
	create_toaster("Item removed by slot", errorLevels.error)
	return 0
}
