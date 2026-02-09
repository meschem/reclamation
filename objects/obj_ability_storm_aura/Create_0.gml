/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited();

name = "Storm Aura"
description = "Periodically strikes nearby units with lightning"
active = false
autoCast = true

curCd = 0
maxCd = 240

treeLevel = 1

radius = 120
damage = 50

giantSlayerBonusDamage = 50

projectileCount = 3

stats = [
	new abilityStat(
		"Damage", "damage", 
		[50, 70, 70, 90, 100]
	),
	new abilityStat(
		"Hit Rate", "maxCd", 
		[240, 240, 220, 200, 180]
	),
	new abilityStat(
		"Lightning Bolts", "projectileCount",
		[3, 3, 4, 4, 5]
	)
]

statBonusShocking = new abilityStatBonus(
	enumCharStats.int, 10,
	"Shock Buildup",
	"Applies |Shock| to affected units"
)

statBonusCuttingBolts = new abilityStatBonus(
	enumCharStats.dex, 20,
	"Cutting Bolts",
	"One bolt will always deal |Critical Damage|"
)

statBonusGiantSlayer = new abilityStatBonus(
	enumCharStats.str, 30,
	"Giant Slayer",
	"Increases base damage to Elites and Bosses by " + string(giantSlayerBonusDamage)
)

charStatBonuses = [statBonusShocking, statBonusCuttingBolts, statBonusGiantSlayer]

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

