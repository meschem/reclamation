/// @description Insert description here
// You can write your code in this editor

event_inherited()

hero = playerCharacters.jonah

endString = ""

///@description					What to do on activation
activate = function() {
	var _hero = hero
	
	with (obj_player_controller) {
		activeCharacterIndex = _hero
	}
		
	restart_run()
}
