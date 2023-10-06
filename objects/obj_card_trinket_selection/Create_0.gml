
// Inherit the parent event
event_inherited();

onClick = function () {
	//FIXME Multiplayer: Assumes single player. Selection window needs owner.
	var player = get_player_target()
	var playerTrinket = get_player_trinket(trinket.object_index, player)
	
	if (playerTrinket == noone) {
		trinket.create()
	} else {
		playerTrinket.levelUp()
	}
	
	close_ability_selection_menu()
}
