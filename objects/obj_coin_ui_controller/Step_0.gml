
if (!setup) {
	return 0
}

age++

if (goldCurrent != player.gold) {
	var _add = (player.gold - goldCurrent)
	
	if (abs(_add) < goldAddMin) {
		goldCurrent = player.gold
	} else {
		goldCurrent += _add * 0.1
	}	
}

if (instance_number(obj_shop_menu_mergers) > 0) {
	x = 216
} else {
	x = drawStart.x
}