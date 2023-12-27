/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited();

name = "Storm Aura"
description = "Periodically strikes all nearby units with lightning"
active = false
autoCast = true

curCd = 0
maxCd = 120

treeLevel = 1

radius = 100
damage = 8

stats = [
	new abilityStat(
		"Damage", "damage", 
		[8, 10, 12, 14, 16]
	),
	new abilityStat(
		"Hit Rate", "maxCd", 
		[120, 120, 110, 110, 100]
	)
]

addRune("Shock Buildup", "Adds shock buildup to damaged targets")
addRune("Concentrate", "Halves radius but triples damage")
addRune("Mega Bolt", "Strikes random target with high damage")

radiusConcentrated = 40

use = function() {
	activate_storm_aura()
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

