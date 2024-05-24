///@description				Gets a random stat amount based on the stat and rarity
///@param {real} _stat		Equipment stat to uses. Uses enum equipmentStats
///@param {real} _rarity	Rarity. Uses enum enumRarity
function get_random_stat_amount(_stat, _rarity) {
	var _amount = 0
	var _min = 0
	var _max = 1
	var _digits = 2
	
	var _statStruct = {
		normal: [0.05, 0.1],
		magic: [0.08, 0.15],
		rare: [0.11, 0.19],
		legendary: [0.14, 0.25]
	}

	switch (_stat) {
		case equipmentStats.bonusAbilityCooldown:
			// std
		break
		
		case equipmentStats.bonusArmor:
			_digits = 0
			_statStruct = {
				normal: [1, 1],
				magic: [1, 2],
				rare: [2, 3],
				legendary: [2, 4]
			}
		break
		
		case equipmentStats.bonusAttackArea:
			// std
		break
		
		case equipmentStats.bonusAttackSpeed:
			// std
		break
		
		case equipmentStats.bonusCritChance:
			// std
		break
		
		case equipmentStats.bonusCritMultiplier:
			// std
		break
		
		case equipmentStats.bonusDamage:
			_digits = 0
			_statStruct = {
				normal: [5, 10],
				magic: [7, 15],
				rare: [9, 20],
				legendary: [11, 25]
			}
		break
		
		case equipmentStats.bonusDamageScalar:
			_statStruct = {
				normal: [0.08, 0.14],
				magic: [0.12, 0.20],
				rare: [0.16, 0.27],
				legendary: [0.2, 0.35]
			}
		break
		
		case equipmentStats.bonusHealth:
			_digits = 0
			_statStruct = {
				normal: [1, 1],
				magic: [1, 2],
				rare: [2, 3],
				legendary: [2, 4]
			}
		break
		
		case equipmentStats.bonusMoveSpeed:
			// std
		break
		
		case equipmentStats.bonusPickupRange:
			_statStruct = {
				normal: [0.5, 0.75],
				magic: [0.75, 1],
				rare: [1, 1.5],
				legendary: [1, 2]
			}
		break
		
		case equipmentStats.bonusPickupReward:
			// std
		break
		
		case equipmentStats.bonusProjectileCount:
			_digits = 0
			_statStruct = {
				normal: [1, 1],
				magic: [1, 2],
				rare: [1, 3],
				legendary: [2, 4]
			}
		break
		
		case equipmentStats.bonusWeaponAoe:
			// std
		break
	}
	
	switch (_rarity) {
		case enumRarity.normal:
			_min = _statStruct.normal[0]
			_max = _statStruct.normal[1]
		break
		
		case enumRarity.magic:
			_min = _statStruct.magic[0]
			_max = _statStruct.magic[1]
		break
		
		case enumRarity.rare:
			_min = _statStruct.rare[0]
			_max = _statStruct.rare[1]
		break
		
		case enumRarity.legendary:
			_min = _statStruct.legendary[0]
			_max = _statStruct.legendary[1]
		break
	}
	
	_amount = round_ext(random_range(_min, _max), _digits)
	
	return _amount
}