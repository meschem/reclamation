///@description   Returns all bonus stat variable names that exist on items
///@return {array<String>}

function get_bonus_stat_vars() {
	var _returnInfo = [
		"bonusHealth",
		"bonusArmor",
		"bonusProjectileCount",
		"bonusCritMultiplier",
		"bonusPickupRange",
		"bonusPickupReward",
		"bonusAreaOfEffect",
		"bonusMoveSpeed",
		"bonusAttackSpeed",
		"bonusAbilityCooldown",
		"bonusDamageScalar",
		"bonusAttackAoe"
	]
	
	return _returnInfo
}

///@description			Returns a stat block
///@param {string} stat
///@param {real} amount
///@param {real} bonusAmount
///@return {struct<statInfo>}
function get_bonus_stat_info(stat, amount, bonusAmount = 0) {
	switch (stat) {
		case "bonusHealth":
			return {
				name: "Bonus Health",
				variable: stat,
				
			}
		
		case "bonusArmor":
		
		case "bonusProjectileCount":
		
		case "bonusCritChance":
		
		case "bonusPickupRange":
		
		case "bonusPickupReward":
		
		case "bonusAreaOfEffect":
		
		case "bonusMoveSpeed":
		
		case "bonusAttackSpeed":
		
		case "bonusAbilityCooldown":
		
		case "bonusDamageScalar":
	}
}

///@description						Creates a stat info text for a single property
///@param {string} _variableName	Name of the variable
///@param {string} _displayName		Name to display
///@param {real} _amount
///@param {real} _bonus
///@param {bool} _isPercentage
function statInfo(_variableName, _displayName = "", _amount = 0, _displayMultiplier = 1, unit = "") constructor {
	variableName = _variableName
	
	if (_displayName == "") {
		// derive displayName from var
		
	}
	
	if (_amount == 0) {
		// derive amount from var
	}
}

