///@description			Manages buffs for the game

//  bonusHealth
//  bonusArmor
//  bonusProjectileCount
//  bonusCritChance
//  bonusPickupRange
//  bonusPickupReward
//  bonusAreaOfEffect
//  bonusMoveSpeed
//  bonusAttackSpeed
//  bonusAbilityCooldown
//  bonusDamageScalar

enum buffValueTypes {
	bonusAttackSpeed,
	bonusMoveSpeed,
	bonusAttackArea,
}

enum buffBoolTypes {
	invuln,
	disarm,
}

///@description						Gets buff value of a certain type. This is for REAL values.
///@param {real} buffType			Uses enum buffValueTypes to get a buff type
///@return {real}
getBuffValue = function(buffType) {
	var buffVariable = "Unset"
	var runningValue = 0
	
	switch (buffType) {
		case buffValueTypes.bonusAttackSpeed:
			buffVariable = "bonusAttackSpeed"
			break
			
		case buffValueTypes.bonusMoveSpeed:
			buffVariable = "bonusMoveSpeed"
			break
			
		case buffValueTypes.bonusAttackArea:
			buffVariable = "bonusAttackArea"
			break
			
		default:
			show_error("Undefined REAL buffType requested", true) 
			break
	}
	
	with (obj_buff) {
		//try {
			runningValue += variable_instance_get(id, buffVariable)
		//} catch(error) {
		//	show_message([buffVariable, runningValue])
		//	show_message(error)
		//}
	}
	
	return runningValue
}

///@description						Gets buff value of a certain type. This is for BOOL values.
///									Bools return true if ANY are true, and false if NONE are true
///@param {real} buffType			Uses enum buffValueTypes to get a buff type
///@return {bool}
getBuffBool = function(buffType) {
	var buffVariable
	
	switch (buffType) {
		case buffBoolTypes.disarm:
			buffVariable = "disarm"
			break
			
		default:
			show_error("Undefined BOOL buffType requested", true) 
			break
	}
	
	with (obj_buff) {
		if (variable_instance_get(id, buffVariable) == true) {
			return true
		}
	}
	
	return false
}