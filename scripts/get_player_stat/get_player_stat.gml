///@description						Gets a specific stat for a player
///@param {real} _playerStat		Uses enumPlayerStats
///@param {id.Instance} _player		Player to get stat for
///@return {real}
function get_player_stat(_playerStat, _player = noone) {
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
	        return _player.critChance

		case enumPlayerStats.critDamageMultiplier:
	        return _player.critMultiplier

		case enumPlayerStats.areaOfEffectScalar:
	        return _player.areaOfEffectScalar

		case enumPlayerStats.abilityCooldownScalar:
	        return _player.abilityCooldownScalar

		case enumPlayerStats.attackSpeedScalar:
	        return _player.attackSpeedScalar

		case enumPlayerStats.knockbackScalar:
	        return _player.knockbackScalar

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
	        return _player.pickupRangeScalar

		case enumPlayerStats.pickupRewardScalar:
	        return _player.pickupRewardScalar

		case enumPlayerStats.weaponAoeScalar:
	        return _player.weaponAoeScalar

		case enumPlayerStats.weaponKnockbackScalar:
	        return _player.weaponKnockbackScalar
			
		case enumPlayerStats.abilityDamageScalar:
			return _player.baseAbilityDamageScalar + _player.bonusAbilityDamageScalar
			
		case enumPlayerStats.magicFind:
			return _player.baseMagicFind + _player.bonusMagicFind
		
		default:
			show_message("Invalid player stat requested")
			return 1
	}
}