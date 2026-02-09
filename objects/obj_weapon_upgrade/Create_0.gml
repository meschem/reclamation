enum weaponUpgradeTypes {
	minor,
	major,
	evolution
}

name = "Unnamed"
description = "No Description"
active = false
weapon = noone
stackable = false

upgradeType = weaponUpgradeTypes.minor

bonusAttackSpeed = 0
bonusDamageScalar = 0
bonusDamage = 0
bonusArmor = 0
bonusHealth = 0
bonusMoveSpeed = 0
bonusAbilityCooldown = 0
bonusCritChance = 0
bonusCritMultiplier = 0
bonusProjectileCount = 0 
bonusPickupRange = 0
bonusPickupReward = 0
bonusWeaponAoe = 0
bonusAbilityDamage = 0
bonusKnockbackScalar = 0

lifeCycleEvents = []

level = 0
maxLevel = 99

stats = []

///@description					Enables a weapon upgrade
enable = function() {
	active = true
	
	level++
	weapon.level++
	
	onLevel()
	
	applyStatsToWeapon()
	
	//process_player_stats()
}

///@description					Applies default stats to attached weapon object
applyStatsToWeapon = function () {
	for (var i = 0; i < array_length(stats); i++) {
		var _var = stats[i].variable
		
		if (variable_instance_exists(weapon, _var)) {
			var _values = stats[i].values  // [level - 1]
			var _index = min(array_length(_values) - 1, level - 1)
			var _val = _values[_index]		
			var _curVal = variable_instance_get(weapon, _var)
		
			var _result = _val + _curVal
	
			variable_instance_set(weapon, _var, _result)
		} else {
			create_toaster("Variable not found on weapon: " + _var, errorLevels.error)
		}
	}
}

///@description					Occurs after level stat has been adjusted. Can do whatever.
///								Update this instead of enable()
onLevel = function() {
	
}

///@description					Adds a lifecycle event to apply to projectiles
///@param {real} _type			enumLifeCycleEvents to add
///@param {function} _func		Function to execute on life cycle event
addLifeCycleEvent = function(_type, _func) {
	array_push(lifeCycleEvents, 
		{
			cycleType: _type,
			cycleFunc: _func
		}
	)
}
