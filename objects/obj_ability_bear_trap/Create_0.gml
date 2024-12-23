///@description		Setup

// Inherit the parent event
event_inherited();

name = "Bear Trap"
description = "Drops a bear trap at your location. Slows and deals high damage to anyone who runs over it. Projectile count affects max traps."
//onHitAbility = true
active = true
selectionIcon = spr_abil_select_icon_bear_trap
treeLevel = 2

curCd = 0
maxCd = seconds_to_frames(3)

autoCast = true
canAutoCast = true

damageDirect = [40, 80, 120, 160, 200]
radius = [60, 60, 80, 80, 100]
damageSplash = [30, 30, 30, 30, 50]
maxTraps = 4

projectile = obj_bear_trap
//projectileCharged = obj_armor_spike_charged

stats = [
	new abilityStat(
		"Direct Damage", "damageDirect", damageDirect
	),
	new abilityStat(
		"Splash Damage", "damageSplash", damageSplash
	),
	new abilityStat(
		"Radius", "radius", radius, true, statUnits.meters
	)
]

addRune("Trap Happy", "Upon entering a room, 10 traps are spawned around the play area.")
addRune("Spreadshot", "Drops 2 traps at a time in an area around you.")

use = function () {
	if (instance_number(obj_bear_trap) < maxTraps) {
		var _inst = instance_create_depth(owner.x, owner.y, depths.playerProjectile, projectile)
		_inst.damageDirect = damageDirect[level - 1]
		_inst.radius = radius[level - 1]
		_inst.damageSplash = damageSplash[level - 1]
		_inst.owner = owner
	}
}

///@description		Gets max traps allows
///@return {real}
getMaxTraps = function() {
	return maxTraps + get_player_stat(enumPlayerStats.bonusProjectileCount, owner)
}
