// Inherit the parent event
event_inherited();

displayText = "Equipment"

state = buttonStates.disabled

onClick = buttonOnClickBehaviors.custom

onClickCustom = function() {
	open_player_inventory(menu)
}
