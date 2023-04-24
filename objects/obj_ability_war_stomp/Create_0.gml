/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited();

name = "War Stomp"
description = "Stuns and damages an area around Jonah"
icon = spr_ability_icon_war_stomp
active = true

curCd = 0
maxCd = 440

activate = function() {
	activate_war_stomp(level)
}
