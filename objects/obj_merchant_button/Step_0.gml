
if (item != noone && !instance_exists(item)) {
	item = noone
	state = buttonStates.disabled
}

switch (state) {
	case buttonStates.normal:
	case buttonStates.selected:
	case buttonStates.clicked:
		image_index = 0
	break
	
	case buttonStates.disabled:
		image_index = 3
	break
}

image_xscale = width / sprite_get_width(spr_backpack_slot_inactive)

if (item != noone) {
	mergeIconActive = item.inValidRecipe
}
