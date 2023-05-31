/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited();

name = "Charge"
description = "Charges towards an area with explosive results"
icon = spr_ability_icon_charge
active = true

curCd = 0
maxCd = 400

enabled = false

treeLevel = 1

use = function() {
	activate_charge(level)
}

