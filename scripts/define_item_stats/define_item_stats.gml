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
			new itemStat("Hit Points", "bonusHealth", "maxHp", statUnits.none, 0.1),
			new itemStat("Armor", "bonusArmor", "armor"),
			new itemStat("Projectile Count", "bonusProjectileCount", "bonusProjectileCount"),
			new itemStat("Crit Multiplier", "bonusCritMultiplier", "critMultiplier", statUnits.percent),
			new itemStat("Pickup Range", "bonusPickupRange", "bonusPickupRangeScalar", statUnits.percent),
			
			new itemStat("Pickup Reward", "bonusPickupReward", "bonusPickupRewardScalar", statUnits.percent),
			new itemStat("Area of Effect", "bonusAreaOfEffect", "areaOfEffectScalar", statUnits.percent),
			new itemStat("Move Speed", "bonusMoveSpeed", "moveSpeedMax", statUnits.moveSpeed),
			new itemStat("Attack Speed", "bonusAttackSpeed", "attackSpeedScalar", statUnits.percent),
			new itemStat("Ability Cooldown", "bonusAbilityCooldown", "abilityCooldownScalar", statUnits.percent),
			
			new itemStat("Damage", "bonusDamageScalar", "bonusDamageScalar", statUnits.percent),
		]
	}
}

///@description					Gets an item stat
///@param {string} enumStat		Enum of item stat
///@return {struct.itemStat}
function get_item_stat(enumStat) {
	return obj_game_controller.itemStats[enumStat]
}
