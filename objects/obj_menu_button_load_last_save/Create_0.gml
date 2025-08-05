// Inherit the parent event
event_inherited();

displayText = "Load Last Save"

onClick = buttonOnClickBehaviors.custom

onClickCustom = function() {
	//obj_profile_controller.loadTempProfiles()
	select_profile(obj_profile_controller.latestProfile)
	start_game_load_player()
	room_goto(rm_start_dev)
}
