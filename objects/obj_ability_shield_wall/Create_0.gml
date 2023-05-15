/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited();

name = "Shield Wall"
description = "Spawns a few shields in a direction that blocks enemies"
icon = spr_ability_icon_war_stomp
active = true

curCd = 0
maxCd = 120

shieldCount = 3
spawnDistance = 72
spawnAngleDiff = 24

treeLevel = 3

use = function() {
	activate_shield_wall(shieldCount, spawnDistance, spawnAngleDiff)
}
