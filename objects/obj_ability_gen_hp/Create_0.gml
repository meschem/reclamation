/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited();

name = "Bonus HP"
description = "Increases HP"
icon = spr_ability_icon_charge
active = false

level = 0
maxLevel = 999

enabled = false

onLevel = function() {
	obj_player.maxHp += 10
}
