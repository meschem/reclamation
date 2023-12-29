///@description   Defines all stats
function define_item_stats() {
	enum enumItemStats {
		bonusHealth,
		bonusArmor,
		bonusProjectileCount,
		bonusCritChance,
		bonusPickupRange,
		
		bonusPickupReward,
		bonusAreaOfEffect,
		bonusMoveSpeed,
		bonusAttackSpeed,
		bonusAbilityCooldown,
		
		bonusDamageScalar,
		custom, // used any time a custom stat property is used
	}
	
	enum statUnits {
		auto,
		none,
		meters,
		seconds,
		percent,
		moveSpeed,
		frames,
		length
	}
	
	// These need to 1:1 match up with enumItemStats
	with (obj_game_controller) {
		itemStats = [
			new itemStatType("Hit Points", "bonusHealth", "maxHp", statUnits.none),
			new itemStatType("Armor", "bonusArmor", "armor"),
			new itemStatType("Projectile Count", "bonusProjectileCount", "bonusProjectileCount"),
			new itemStatType("Crit Multiplier", "bonusCritMultiplier", "critMultiplier", statUnits.percent),
			new itemStatType("Pickup Range", "bonusPickupRange", "bonusPickupRangeScalar", statUnits.percent),
			
			new itemStatType("Pickup Reward", "bonusPickupReward", "bonusPickupRewardScalar", statUnits.percent),
			new itemStatType("Area of Effect", "bonusAreaOfEffect", "areaOfEffectScalar", statUnits.percent),
			new itemStatType("Move Speed", "bonusMoveSpeed", "moveSpeedMax", statUnits.moveSpeed),
			new itemStatType("Attack Speed", "bonusAttackSpeed", "attackSpeedScalar", statUnits.percent),
			new itemStatType("Ability Cooldown", "bonusAbilityCooldown", "abilityCooldownScalar", statUnits.percent),
			
			new itemStatType("Damage", "bonusDamageScalar", "bonusDamageScalar", statUnits.percent),
		]
	}
}

///@description					Gets an item stat
///@param {string} enumStat		Enum of item stat
///@return {struct.itemStat}
function get_item_stat(enumStat) {
	return obj_game_controller.itemStats[enumStat]
}
