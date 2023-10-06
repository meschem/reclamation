
// Inherit the parent event
event_inherited()

upgrade = noone

onClick = function () {
	//FIXME Multiplayer: Assumes single player. Selection window needs owner.
	var player = get_player_target()
	
	if (upgrade == noone) {
		show_error("Upgrade == noone", true)
	}
	
	upgrade.enable()
	
	close_ability_selection_menu()
}
