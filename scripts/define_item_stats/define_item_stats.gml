///@description   Defines all stats
function define_item_stats() {
	enum enumItemStats {
		bonusStr,
		bonusDex,
		bonusInt,
		
		bonusHealth,
		bonusArmor,
		bonusProjectileCount,
		bonusCritMultiplier,
		bonusPickupRange,
		
		bonusPickupReward,
		bonusAreaOfEffect,
		bonusMoveSpeed,
		bonusAttackSpeed,
		bonusAbilityCooldown,
		
		bonusPoisonDamage,
		bonusRecoveryTime,
		bonusBurningStacks,
		
		bonusDamageScalar,
		bonusWeaponAoe,
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
	//with (obj_game_controller) {
	itemStatTypes = [
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
		
		new itemStatType("Poison Damage", "bonusPoisonDamage", "bonusPoisonDamage"),
		new itemStatType("Recovery Time", "bonusRecoveryTime", "bonusRecoveryTime", statUnits.seconds),
		new itemStatType("Burning Stacks", "bonusBurningStacks", "bonusBurningStacks"),
		
		new itemStatType("Damage", "bonusDamageScalar", "bonusDamageScalar", statUnits.percent),
		new itemStatType("Weapon AOE", "bonusWeaponAoe", "bonusWeaponAoe", statUnits.percent),
		
		new itemStatType("Strength", "bonusStr", "bonusStr"),
		new itemStatType("Dexterity", "bonusDex", "bonusStr"),
		new itemStatType("Intelligence", "bonusInt", "bonusStr"),
	]
}

///@description					Gets an item stat
///@param {string} _enumStat		Uses enumItemStats
///@return {struct}
function get_item_stat_type(_enumStat) {
	var _displayName, _bonusVar, _playerVar, _statUnit, _prepend
	
	switch (_enumStat) {
		case enumItemStats.bonusStr:
			_displayName = "Strength"
			_bonusVar = "bonusStr"
			_playerVar = "bonusStr"
			_statUnit = statUnits.none
		break
		
		case enumItemStats.bonusDex:
			_displayName = "Dexterity"
			_bonusVar = "bonusDex"
			_playerVar = "bonusDex"
			_statUnit = statUnits.none
		break
		
		case enumItemStats.bonusInt:
			_displayName = "Intelligence"
			_bonusVar = "bonusInt"
			_playerVar = "bonusInt"
			_statUnit = statUnits.none
		break
		
		case enumItemStats.bonusHealth:
			_displayName = "Hit Points"
			_bonusVar = "bonusHealth"
			_playerVar = "maxHp"
			_statUnit = statUnits.none
		break
		
		case enumItemStats.bonusArmor:
			_displayName = "Armor"
			_bonusVar = "bonusArmor"
			_playerVar = "armor"
			_statUnit = statUnits.none
		break
		
		case enumItemStats.bonusProjectileCount:
			_displayName = "Projectile Count"
			_bonusVar = "bonusProjectileCount"
			_playerVar = _bonusVar
			_statUnit = statUnits.none
		break
		
		case enumItemStats.bonusCritMultiplier:
			_displayName = "Crit Multiplier"
			_bonusVar = "critMultiplier"
			_playerVar = _bonusVar
			_statUnit = statUnits.percent
		break
		
		case enumItemStats.bonusPickupRange:
			_displayName = "Pickup Range"
			_bonusVar = "bonusPickupRange"
			_playerVar = _bonusVar
			_statUnit = statUnits.percent
		break
		
		case enumItemStats.bonusPickupReward:
			_displayName = "Pickup Reward"
			_bonusVar = "bonusPickupReward"
			_playerVar = _bonusVar
			_statUnit = statUnits.percent
		break
		
		case enumItemStats.bonusAreaOfEffect:
			_displayName = "Ability AOE"
			_bonusVar = "bonusAreaOfEffect"
			_playerVar = "areaOfEffectScalar"
			_statUnit = statUnits.percent
		break
		
		case enumItemStats.bonusMoveSpeed:
			_displayName = "Move Speed"
			_bonusVar = "bonusMoveSpeed"
			_playerVar = _bonusVar
			_statUnit = statUnits.percent
		break
		
		case enumItemStats.bonusAttackSpeed:
			_displayName = "Attack Speed"
			_bonusVar = "bonusAttackSpeed"
			_playerVar = _bonusVar
			_statUnit = statUnits.percent
		break
		
		case enumItemStats.bonusAbilityCooldown:
			_displayName = "Ability Cooldown"
			_bonusVar = "bonusAbilityCooldown"
			_playerVar = "abilityCooldownScalar"
			_statUnit = statUnits.percent
		break
		
		case enumItemStats.bonusDamageScalar:
			_displayName = "Damage"
			_bonusVar = "bonusDamageScalar"
			_playerVar = _bonusVar
			_statUnit = statUnits.percent
		break
		
		case enumItemStats.bonusWeaponAoe:
			_displayName = "Weapon AOE"
			_bonusVar = "bonusWeaponAoe"
			_playerVar = _bonusVar
			_statUnit = statUnits.percent
		break
		
		case enumItemStats.bonusPoisonDamage:
			_displayName = "Poison Dmg"
			_bonusVar = "bonusPoisonDamage"
			_playerVar = _bonusVar
			_statUnit = statUnits.none
		break
		
		case enumItemStats.bonusRecoveryTime:
			_displayName = "Recovery Time"
			_bonusVar = "bonusRecoveryTime"
			_playerVar = _bonusVar
			_statUnit = statUnits.seconds
		break
		
		case enumItemStats.bonusBurningStacks:
			_displayName = "Burning Stacks"
			_bonusVar = "bonusBurningStacks"
			_playerVar = _bonusVar
			_statUnit = statUnits.none
		break
		
		default:
			throw("Undefined enumItemStats unit")
		break
	}
	
	return {
		displayName: _displayName,
		bonusVar: _bonusVar,
		playerVar: _playerVar,
		unitEnum: _statUnit,
		prepend: true
	}
}
