///@description					Attempts to create a standardized item stat from an
///@param {string} _var			String of the variable
///@param {real|array} _amount	Amount for the variable
function create_item_stat_from_var(_var, _amount) {
	if (!is_array(_amount)) {
		_amount = [_amount]
	}
	
	switch (_var) {
		case "bonusAbilityCooldown":
			return new itemStat(enumItemStats.bonusAbilityCooldown, _amount)
		
		case "bonusArmor":
			return new itemStat(enumItemStats.bonusArmor, _amount)
		
		case "bonusAttackSpeed":
			return new itemStat(enumItemStats.bonusAttackSpeed, _amount)			

		case "bonusCritMultiplier":
			return new itemStat(enumItemStats.bonusCritMultiplier, _amount)
		
		case "bonusDamageScalar":
			return new itemStat(enumItemStats.bonusDamageScalar, _amount)
		
		case "bonusHealth":
			return new itemStat(enumItemStats.bonusHealth, _amount)
		
		case "bonusMoveSpeed":
			return new itemStat(enumItemStats.bonusMoveSpeed, _amount)
		
		case "bonusPickupRange":
			return new itemStat(enumItemStats.bonusPickupRange, _amount)
		
		case "bonusPickupReward":
			return new itemStat(enumItemStats.bonusPickupReward, _amount)

		case "bonusWeaponAoe":
			return new itemStat(enumItemStats.bonusWeaponAoe, _amount)

	
		default:
			throw("create_item_stat_from_var() called with invalid stat: " + _var)
		break
	}
}