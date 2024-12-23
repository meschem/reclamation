///@description						Gets a specific stat for a player
///@param {real} _playerStat		Uses enumPlayerStats
///@param {id.Instance} _player		Player to get stat for
///@return {real}
function get_player_stat(_playerStat, _player = noone) {
	if (_player == noone) {
		_player = get_first_player()
	}
	
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
	        return _player.damageScalar

		case enumPlayerStats.pickupRangeScalar:
	        return _player.pickupRangeScalar

		case enumPlayerStats.pickupRewardScalar:
	        return _player.pickupRewardScalar

		case enumPlayerStats.weaponAoeScalar:
	        return _player.weaponAoeScalar

		case enumPlayerStats.weaponKnockbackScalar:
	        return _player.weaponKnockbackScalar
		
		default:
			show_message("Invalid player stat requested")
			return 1
		break		
	}
}