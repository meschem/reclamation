/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited();

name = "Thorns"
description = "Returns pointy damage to attackers"
onHitAbility = true
active = false

treeLevel = 2

activate = function() {
	activate_spiked_armor(level)
}
