/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited();

name = "Flurry"
description = "Rapidly attacks in a spread pattern"
active = true

curCd = 0
maxCd = 240

enabled = false

treeLevel = 2

use = function() {
	activate_flurry(level)
}
