/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited();

name = "Poison Wave"
description = "Fires a serpentine wave that poisons everything it touches."
//onHitAbility = true
active = true
selectionIcon = spr_abil_select_icon_poison_wave

treeLevel = 2

curCd = 0
maxCd = seconds_to_frames(8)

autoCast = true
canAutoCast = true

damageDirect = 10
yScalar = [1, 1, 1, 1.25, 1.5]
poisonDamageBonus = [5, 10, 20, 20, 30]

//spiralRotationSpeed = 3
//lightningShockAmount = 180

projectile = obj_poison_wave
//projectileCharged = obj_armor_spike_charged

stats = [
	new abilityStat(
		"Size", "yScalar", 
		yScalar,
		true,
		statUnits.percent
	),
	new abilityStat(
		"Poison Dmg Bonus",
		"poisonDamageBonus",
		poisonDamageBonus
	)
]

addRune("Nova", "Shoots 8 smaller projectiles in a circular pattern")
addRune("Crawling Toxin", "Slows projectiles while increasing distance")
addRune("Pools of Pain", "Projectiles leave trails of damaging pools")

//onLevel = function() {
//	if (level == 1) {
//		owner.bonusPoisonDamage += poisonDamageBonus[level - 1]
//	} else {
//		var _diff = poisonDamageBonus[level - 1] - poisonDamageBonus[level - 2]
//		owner.bonusPoisonDamage += _diff
//	}
//}

use = function () {
	var _inst = instance_create_depth(owner.x + 20, owner.y, depths.playerProjectile, projectile)
	_inst.xVel = 0
	_inst.xAccel = 0.1
	_inst.damageDirect = damageDirect
	//_inst.poisonStacksOnHit = poisonStacksOnHit[level - 1]
	_inst.yScalar = yScalar[level - 1]
	_inst.owner = owner
	
	_inst = instance_create_depth(owner.x - 20, owner.y, depths.playerProjectile, projectile)
	_inst.xVel = 0
	_inst.xAccel = -0.1
	_inst.damageDirect = damageDirect
	//_inst.poisonStacksOnHit = poisonStacksOnHit[level - 1]
	_inst.yScalar = yScalar[level - 1]
	_inst.owner = owner
}
