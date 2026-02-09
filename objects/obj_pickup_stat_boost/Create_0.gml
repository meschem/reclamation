event_inherited()

name = "Food"

bonusStr = 0
bonusDex = 0
bonusInt = 0

rarity = enumRarity.normal

pickupValue = 1

lifeSpan = -1

reflectOffsetY = 12

shadowSprite = spr_shadow_med
shadowOffset = 0

init_floating(2, 90)

onPickup = function(_player) {
	var _offsetY = 0
	
	if (bonusStr > 0) {
		create_pickup_text_custom(_player.x, _player.y, bonusStr, c_white, spr_player_stats_icon_str, "Strength")
		_player.baseStr += bonusStr
		_offsetY -= 10
	}
	
	if (bonusDex > 0) {
		create_pickup_text_custom(_player.x, _player.y - _offsetY, bonusDex, c_white, spr_player_stats_icon_dex, "Dexterity")
		_player.baseDex += bonusDex
		_offsetY -= 10
	}
	
	if (bonusInt > 0) {
		create_pickup_text_custom(_player.x, _player.y - _offsetY, bonusInt, c_white, spr_player_stats_icon_int, "Intelligence")
		_player.baseInt += bonusInt
	}

	audio_play_sound(snd_crunchy_eating, 1, false)
	//var _statName = "Unknown"
	
	//switch (stat) {
	//	case enumPlayerStats.str:
	//		_player.baseStr += pickupValue
	//		_statName = "Str"
	//	break
		
	//	case enumPlayerStats.dex:
	//		_player.baseDex += pickupValue
	//		_statName = "Dex"
	//	break
		
	//	case enumPlayerStats.int:
	//		_player.baseInt += pickupValue
	//		_statName = "Int"
	//	break
	//}
	
	//var _pickupString = $"+{pickupValue} {_statName}!"
	
	//create_pickup_text(x, y, pickupValue, pickupTextStyles.normal)
    process_player_stats()
	
	instance_destroy()
}
