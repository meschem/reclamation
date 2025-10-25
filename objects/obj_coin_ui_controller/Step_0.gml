
if (!setup || game_is_paused()) {
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
