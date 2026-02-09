///@description					Gets the string for the equipment stat variable
///@param {real} _statEnum		Uses enum equipmentStats
///@return {string}
function get_equipment_var_by_enum(_statEnum){
	switch (_statEnum) {
		case equipmentStats.bonusStr:
			return "bonusStr"
			
		case equipmentStats.bonusDex:
			return "bonusDex"
			
		case equipmentStats.bonusInt:
			return "bonusInt"
			
		case equipmentStats.bonusAbilityCooldown:
			return "bonusAbilityCooldown"
			
		case equipmentStats.bonusArmor:
			return "bonusArmor"
		
		case equipmentStats.bonusAttackSpeed:
			return "bonusAttackSpeed"
		
		case equipmentStats.bonusCritMultiplier:
			return "bonusAttackSpeed"
		
		case equipmentStats.bonusDamageScalar:
			return "bonusDamageScalar"
		
		case equipmentStats.bonusHealth:
			return "bonusHealth"
		
		case equipmentStats.bonusMoveSpeed:
			return "bonusMoveSpeed"
		
		case equipmentStats.bonusPickupRange:
			return "bonusPickupRange"
		
		case equipmentStats.bonusPickupReward:
			return "bonusPickupReward"
		
		case equipmentStats.bonusWeaponAoe:
			return "bonusWeaponAoe"
			
		default:
			throw("Bad enum return for get_equipment_var_by_name(): " + string(_statEnum))
		break
	}
}
