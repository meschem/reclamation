
stats = {}

define_player_stats()

getPlayerStatName = function(_enum) {
	try {
		return stats[$ _enum].statName
	} catch (err) {
		show_message(_enum)
	}
} 

getPlayerStatDescription = function(_enum) {
	return stats[$ _enum].statDescription
} 

getPlayerStatValueReadable = function(_enum) {
	return stats[$ _enum].getReadableValue()
}

getPlayerStatValue = function(_playerStat, _player = noone) {
	if (_player == noone) {
		_player = get_first_player()
	}
	
	var _runningBonus = 0

	switch (_playerStat) {
		case enumPlayerStats.maxHp:
			return _player.maxHp

		case enumPlayerStats.moveSpeedMax:
	        return _player.moveSpeedMax

		case enumPlayerStats.maxArmor:
	        return _player.maxArmor

		case enumPlayerStats.critChance:
	        return _player.critChance + _player.bonusCritChance

		case enumPlayerStats.critDamageMultiplier:
	        return _player.critMultiplier // + _player.bonusCritMultipler

		case enumPlayerStats.areaOfEffectScalar:
	        return _player.baseAreaOfEffectScalar + _player.bonusAreaOfEffectScalar

		case enumPlayerStats.abilityCooldownScalar:
	        return _player.abilityCooldownScalar

		case enumPlayerStats.attackSpeedScalar:
	        return _player.attackSpeedScalar

		case enumPlayerStats.knockbackScalar:
	        return _player.baseKnockbackMultiplier + _player.bonusKnockbackMultiplier

		case enumPlayerStats.bonusProjectileCount:
	        return _player.bonusProjectileCount

		case enumPlayerStats.damageScalar:
			with (obj_buff_stats) {
				if (owner == _player) {
					_runningBonus += bonusDamageScalar
				}
			}
	        return _player.bonusDamageScalar + _runningBonus

		case enumPlayerStats.pickupRangeScalar:
	        return _player.basePickupRangeScalar + _player.bonusPickupRangeScalar

		case enumPlayerStats.pickupRewardScalar:
	        return _player.basePickupRewardScalar + _player.bonusPickupRewardScalar

		case enumPlayerStats.weaponAoeScalar:
	        return -1

		case enumPlayerStats.weaponKnockbackScalar:
	        return _player.weaponKnockbackScalar
			
		case enumPlayerStats.abilityDamageScalar:
			return _player.baseAbilityDamageScalar + _player.bonusAbilityDamageScalar
			
		case enumPlayerStats.magicFind:
			return _player.baseMagicFind + _player.bonusMagicFind
			
		case enumPlayerStats.str:
			return _player.baseStr + _player.bonusStr
			
		case enumPlayerStats.dex:
			return _player.baseDex + _player.bonusDex
			
		case enumPlayerStats.int:
			return _player.baseInt + _player.bonusInt
		
		default:
			//show_message("Invalid player stat requested") 
			return -1
	}
}