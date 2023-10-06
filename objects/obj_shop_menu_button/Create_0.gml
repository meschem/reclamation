
///@description			Button

event_inherited()

width = 100
height = 60

player = get_player_target() //FIXME: MULTIPLAYER

item = noone

onClick = function () {
	if (item == noone) {
		show_message("Equipment not set on shop menu button")
	}
	
	if (player.gold < item.cost) {
		show_message("Not enough money")
	} else {
		item.purchase(player)
		player.equipItem(item)
		state = buttonStates.disabled
	}
}
