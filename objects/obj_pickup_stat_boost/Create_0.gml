event_inherited()

stat = enumPlayerStats.str
pickupValue = 1

lifeSpan = -1

reflectOffsetY = 8

shadowSprite = spr_shadow_med
shadowOffset = 6

init_floating(2, 90)

onPickup = function(_player) {
	var _statName = "Unknown"
	
	switch (stat) {
		case enumPlayerStats.str:
			_player.baseStr += pickupValue
			_statName = "Str"
		break
		
		case enumPlayerStats.dex:
			_player.baseDex += pickupValue
			_statName = "Dex"
		break
		
		case enumPlayerStats.int:
			_player.baseInt += pickupValue
			_statName = "Int"
		break
	}
	
	var _pickupString = $"+{pickupValue} {_statName}!"
	
	create_pickup_text(x, y, pickupValue, pickupTextStyles.normal)
	
	instance_destroy()
}
