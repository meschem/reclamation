///@description		Setup

// Inherit the parent event
event_inherited()

name = "Spirit Wolf"
description = "Summons a wolf that roams around attacking baddies. Inherits player's crit multiplier."
//onHitAbility = true
active = true
//selectionIcon = spr_abil_select_icon_bear_trap
treeLevel = 2

curCd = 0
maxCd = stf(20)

autoCast = true
canAutoCast = true

summonEntity = obj_spirit_wolf

damage = [15, 25, 25, 40, 40]
critChance = [0.1, 0.15, 0.15, 0.2, 0.3]
attackCooldown = [
	stf(2),
	stf(2),
	stf(1.5),
	stf(1.5),
	stf(1),
]

addRune("Twin Wolves", "Double the wolves.")
addRune("Venomous Claws", "Inflicts poison on hit.")

stats = [
	new abilityStat(
		"Damage", "damage", damage
	),
	new abilityStat(
		"Crit Chance", "critChance", critChance, true, statUnits.percent
	),
	new abilityStat(
		"Attack Cooldown", "attackCooldown", attackCooldown, true, statUnits.seconds
	)
]

use = function () {
	var _inst = instance_create_depth(owner.x, owner.y, depths.player, summonEntity)
	_inst.owner = owner
	_inst.damage = damage[level - 1]
	_inst.critChance = critChance[level - 1]
	_inst.swipeCdMax = attackCooldown[level - 1]
}
