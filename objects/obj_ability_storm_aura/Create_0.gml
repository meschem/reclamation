/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited();

name = "Storm Aura"
description = "Periodically strikes all nearby units with lightning"
icon = spr_ability_icon_war_stomp
active = false
autoCast = true

curCd = 0
maxCd = 180

treeLevel = 1

use = function() {
	activate_storm_aura(level)
}

onLevel = function() {
	if (level == 1) {
		instance_create_depth(
			obj_player.x,
			obj_player.y,
			depths.player + 1,
			obj_aura_storm_aura
		)
	}
}
