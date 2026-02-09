 
// Inherit the parent event
event_inherited();

section = mapSections.islandEast

displayText = ""

onClick = buttonOnClickBehaviors.custom
destination = rm_combat_testing

onClickCustom = function() {
	start_single_room_run(destination)
	room_goto(destination)
}
