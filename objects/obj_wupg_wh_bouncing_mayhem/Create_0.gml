
event_inherited()

name = "Bouncing Mayhem"
description = "Bounces off wall and camera bounds, increasing damage on bounces. Greatly increases range."

upgradeType = weaponUpgradeTypes.major

rangeScalar = [1.0]
bonusDamageOnBounce = [15]

stats = [
	new abilityStat(
		"Bounce Bonus Dmg",
		"bonusDamageOnBounce",
		bonusDamageOnBounce,
	),
	new abilityStat(
		"Range Bonus",
		"rangeScalar",
		rangeScalar,
		true, statUnits.percent
	),
]

onLevel = function() {
	with (obj_weapon) {
		bounces = true
	}
}

//addLifeCycleEvent(enumLifeCycleEvents.targetHit, function(_data) {
	//var _target = _data.target
	
	//if (object_is_ancestor(_data.projectile, )
	//	if (_target.poisonStacks > 0) {
	//		_data.projectile.damageDirect *= (1 + bonusPoisonDamageScalar[0])
	//	}
	
//})
