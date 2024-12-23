
event_inherited()

name = "Poison Tipped"
description = "A random dagger in each volley becomes poisonous."

upgradeType = weaponUpgradeTypes.major

poisonDamageBonus = [10]

stats = [
	new abilityStat(
		"Poison Dmg Bonus",
		"poisonDamageBonus",
		poisonDamageBonus
	)
]

onLevel = function() {
	weapon.owner.bonusPoisonDamage += poisonDamageBonus[0]
	weapon.poisons = true
}

//addLifeCycleEvent(enumLifeCycleEvents.targetHit, function(_data) {
	//var _target = _data.target
	
	//if (object_is_ancestor(_data.projectile, )
	//	if (_target.poisonStacks > 0) {
	//		_data.projectile.damageDirect *= (1 + bonusPoisonDamageScalar[0])
	//	}
	
//})
