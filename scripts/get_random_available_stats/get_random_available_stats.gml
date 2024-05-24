///@description				Returns all available stats for a slot and rarity of equipment
///@param {real} _slot		Uses enum equipmentSlots
///@param {real} _rarity	Uses enum enumRarity
///@return {real}
function get_random_available_stats(_slot, _rarity) {
	var _stats = []
	
	switch (_slot) {
		case equipmentSlots.boots:
			_stats = [
				equipmentStats.bonusCritMultiplier,
				equipmentStats.bonusHealth,
				equipmentStats.bonusMoveSpeed,
				equipmentStats.bonusPickupRange
			]
		break
		
		case equipmentSlots.chest:
			_stats = [
				equipmentStats.bonusArmor,
				equipmentStats.bonusHealth,
				equipmentStats.bonusDamageScalar,
				equipmentStats.bonusWeaponAoe
			]
		break
		
		case equipmentSlots.gloves:
			_stats = [
				equipmentStats.bonusAttackSpeed,
				equipmentStats.bonusCritMultiplier,
				equipmentStats.bonusDamageScalar,
				equipmentStats.bonusWeaponAoe
			]
		break
		
		case equipmentSlots.head:
			_stats = [
				equipmentStats.bonusAbilityCooldown,
				equipmentStats.bonusArmor,
				equipmentStats.bonusHealth,
				equipmentStats.bonusPickupRange,
				equipmentStats.bonusPickupReward
			]
		break
		
		case equipmentSlots.neck:
			_stats = [
				equipmentStats.bonusAbilityCooldown,
				equipmentStats.bonusCritMultiplier,
				equipmentStats.bonusMoveSpeed,
				equipmentStats.bonusPickupReward,
				equipmentStats.bonusWeaponAoe
			]
		break
		
		case equipmentSlots.ringLeft:
		case equipmentSlots.ringRight:
			_stats = [
				equipmentStats.bonusAbilityCooldown,
				equipmentStats.bonusAttackSpeed,
				equipmentStats.bonusDamageScalar,
				equipmentStats.bonusPickupRange,
				equipmentStats.bonusWeaponAoe
			]
		break
	}
	
	if (array_length(_stats) == 0) {
		throw($"No stats found for equipment. Slot:{_slot}, Rarity: {_rarity}")
	}
	
	return array_shuffle(_stats)
}
