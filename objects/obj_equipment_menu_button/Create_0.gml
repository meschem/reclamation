
///@description			Button

event_inherited()

width = 100
height = 60

player = obj_player // get_player_target() //FIXME: MULTIPLAYER

item = noone

onClick = function () {
	if (item == noone) {
		show_message("Equipment not set on shop menu button")
	}
	
	if (player.gold < item.cost) {
		create_toaster("Insufficient Gold")
	} else {
		item.purchase(player)
		player.equipItem(item)
		state = buttonStates.disabled
	}
}
