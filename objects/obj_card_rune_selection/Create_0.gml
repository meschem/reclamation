
// Inherit the parent event
event_inherited();

subTitleText.location = new vec2(14, 46)
bodyText.location = new vec2(6, 67)

onClick = function () {
	rune.enabled = true
	
	add_run_stat(enumRunStats.runesGained)
	
	close_ability_selection_menu()
}
