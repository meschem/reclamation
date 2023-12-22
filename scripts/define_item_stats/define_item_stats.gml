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
	}
	
	with (obj_game_controller) {
		itemStats = [
			new itemStat("Hit Points", "bonusHealth", "maxHp"),
			new itemStat("Armor", "bonusArmor", "armor"),
			new itemStat("Projectile Count", "bonusProjectileCount", "bonusProjectileCount"),
			new itemStat("Crit Chance", "bonusCritChance", "critChance", true),
			new itemStat("Pickup Range", "bonusPickupRange", "bonusPickupRangeScalar", true, true),
			
			new itemStat("Pickup Reward", "bonusPickupReward", "bonusPickupRewardScalar", true, true),
			new itemStat("Area of Effect", "bonusAreaOfEffect", "areaOfEffectScalar", true, true),
			new itemStat("Move Speed", "bonusMoveSpeed", "moveSpeedMax"),
			new itemStat("Attack Speed", "bonusAttackSpeed", "attackSpeedScalar", true, true),
			new itemStat("Ability Cooldown", "bonusAbilityCooldown", "abilityCooldownScalar", true, true),
			
			new itemStat("Damage", "bonusDamageScalar", "bonusDamageScalar", true, true),
		]
	}
}

///@description					Gets an item stat
///@param {string} enumStat		Enum of item stat
///@return {struct.itemStat}
function get_item_stat(enumStat) {
	return obj_game_controller.itemStats[enumStat]
}
