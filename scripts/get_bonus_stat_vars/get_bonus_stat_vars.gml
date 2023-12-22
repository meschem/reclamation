///@description   Returns all bonus stat variable names that exist on items
///@return {array<String>}

function get_bonus_stat_vars() {
	var returnInfo = [
		"bonusHealth",
		"bonusArmor",
		"bonusProjectileCount",
		"bonusCritChance",
		"bonusPickupRange",
		"bonusPickupReward",
		"bonusAreaOfEffect",
		"bonusMoveSpeed",
		"bonusAttackSpeed",
		"bonusAbilityCooldown",
		"bonusDamageScalar"
	]
	
	return returnInfo
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

///@description				Stat info block
///@param {string} _name
///@param {string} _variable
///@param {real} _amount
///@param {real} _bonus
///@param {bool} _isPercentage
function statInfo(_name, _variable, _amount, _bonus, _isPercentage) constructor {
	name = _name
	variable = _variable
	amount = _amount
	bonus = _bonus
	isPercentage = _isPercentage
}

