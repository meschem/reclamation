
event_inherited()

name = "Toxic Cuts"
description = "Deals bonus damage to poisoned targets. This is scaled after base damage bonuses."

upgradeType = weaponUpgradeTypes.major

bonusPoisonDamageScalar = [0.3]

stats = [
	new abilityStat(
		"Bonus Damage",
		"bonusPoisonDamageScalar",
		bonusPoisonDamageScalar
	)
]

//addLifeCycleEvent(enumLifeCycleEvents.targetHit, function(_data) {
	//var _target = _data.target
	
	//if (object_is_ancestor(_data.projectile, )
	//	if (_target.poisonStacks > 0) {
	//		_data.projectile.damageDirect *= (1 + bonusPoisonDamageScalar[0])
	//	}
	
//})
