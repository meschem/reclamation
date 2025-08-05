// Inherit the parent event
event_inherited();

displayText = ""

onClick = buttonOnClickBehaviors.custom
profile = noone

onClickCustom = function() {
	if (profile == noone) {
		show_message("Profile not loaded on button")
		
		return 0
	}
	
	select_profile(profile)
	start_game_load_player()
	room_goto(rm_start_dev)
}
