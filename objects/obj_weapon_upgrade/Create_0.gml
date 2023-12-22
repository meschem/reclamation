
name = "Unnamed"
description = "No Description"
active = false
weapon = noone

bonusAttackSpeed = 0
bonusDamageScalar = 0
bonusDamage = 0
bonusArmor = 0
bonusHealth = 0
bonusMoveSpeed = 0
bonusAbilityCooldown = 0
bonusCritChance = 0
bonusProjectileCount = 0 
bonusPickupRange = 0
bonusPickupReward = 0
bonusWeaponAoe = 0

lifeCycleEvents = []

///@description					Enables a weapon upgrade
enable = function() {
	active = true
	
	process_player_stats()
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