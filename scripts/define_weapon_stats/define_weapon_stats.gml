///@description   Defines all stats
function define_weapon_stats() {
	enum enumWeaponStats {
		damage,
		knockback,
		critDamage,
		projectileScale,
		projectileCount,
		projectileSpeed,
		projectileSpread,
		cooldown,
		custom
	}
	
	//enum statUnits {
	//	auto,
	//	none,
	//	meters,
	//	seconds,
	//	percent,
	//	moveSpeed,
	//	frames,
	//	length
	//}

	// These need to 1:1 match up with enumItemStats
	//with (obj_game_controller) {
	//itemStatTypes = [
	//	new itemStatType("Hit Points", "bonusHealth", "maxHp", statUnits.none),
	//	new itemStatType("Armor", "bonusArmor", "armor"),
	//	new itemStatType("Projectile Count", "bonusProjectileCount", "bonusProjectileCount"),
	//	new itemStatType("Crit Multiplier", "bonusCritMultiplier", "critMultiplier", statUnits.percent),
	//	new itemStatType("Pickup Range", "bonusPickupRange", "bonusPickupRangeScalar", statUnits.percent),
		
	//	new itemStatType("Pickup Reward", "bonusPickupReward", "bonusPickupRewardScalar", statUnits.percent),
	//	new itemStatType("Area of Effect", "bonusAreaOfEffect", "areaOfEffectScalar", statUnits.percent),
	//	new itemStatType("Move Speed", "bonusMoveSpeed", "moveSpeedMax", statUnits.moveSpeed),
	//	new itemStatType("Attack Speed", "bonusAttackSpeed", "attackSpeedScalar", statUnits.percent),
	//	new itemStatType("Ability Cooldown", "bonusAbilityCooldown", "abilityCooldownScalar", statUnits.percent),
		
	//	new itemStatType("Damage", "bonusDamageScalar", "bonusDamageScalar", statUnits.percent),
	//	new itemStatType("Weapon AOE", "bonusWeaponAoe", "bonusWeaponAoe", statUnits.percent),
	//]
}

///@description					Gets an item stat
///@param {real} enumStat		Uses enum enumWeaponStats
///@return {struct}				Includes displayName and unitEnum based on statUnits
function get_weapon_stat_type(_enumStat) {
	var _displayName, _statUnit
	
	switch (_enumStat) {
		case enumWeaponStats.damage:
			_displayName = "Damage"
			_statUnit = statUnits.none
		break
		
		case enumWeaponStats.knockback:
			_displayName = "Knockback"
			_statUnit = statUnits.meters
		break
		
		case enumWeaponStats.critDamage:
			_displayName = "Crit Damage Multiplier"
			_statUnit = statUnits.percent
		break
		
		case enumWeaponStats.projectileCount:
			_displayName = "Projectile Count"
			_statUnit = statUnits.none
		break
		
		case enumWeaponStats.projectileScale:
			_displayName = "Projectile Scale"
			_statUnit = statUnits.percent
		break
		
		case enumWeaponStats.projectileSpeed:
			_displayName = "Projectile Speed"
			_statUnit = statUnits.moveSpeed
		break
		
		case enumWeaponStats.cooldown:
			_displayName = "Cooldown"
			_statUnit = statUnits.frames	
		break
		
		case enumWeaponStats.projectileSpread:
			_displayName = "Projectile Spread"
			_statUnit = statUnits.percent
		break
		
		default:
			throw("Invalid enumWeaponStats unit")
		break
	}
	
	return {
		displayName: _displayName,
		unitEnum: _statUnit,
	}
}
