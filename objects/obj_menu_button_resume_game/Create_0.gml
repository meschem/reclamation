// Inherit the parent event
event_inherited();

displayText = "Resume"

onClick = buttonOnClickBehaviors.custom

onClickCustom = function() {
	menu.close()
	menu = -1
	set_game_pause_state(false)
	create_toaster("Resume Game")
}
