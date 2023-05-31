
name = "No Name"
description = "No description yet"

icon = spr_not_set
iconX = -999
iconY = -999

autoCast = false
enabled = false
onHitAbility = false
onStrikeAbility = false
active = false
curCharges = 1
maxCharges = 1

age = 0

level = 0
maxLevel = 3

curCd = 300
maxCd = 300

treeLevel = 2
hotkey = -1

runes = []

///@return {bool}
canActivate = function() {
	if (!active)
		return false
	
	if (curCharges <= 0)
		return false
	
	return true
}

activate = function() {
	if (curCharges == maxCharges) {
		curCd = maxCd	
	}

	curCharges--
	
	use()
}

use = function() {
	show_message("use() not set on ability object")
}

levelUp = function () {
	level++
	
	enabled = true
	
	iconX = 1 + (26 * (treeLevel - 1))
	iconY = 42
	
	if (active) {
		obj_player.activeAbilities[treeLevel - 1] = id
	}
	
	if (onHitAbility) {
		array_push(obj_player.onHitAbilities, id)
		//obj_player.onHitAbilities[array_length(obj_player.onHitAbilities)] = id
	}
	
	if (onStrikeAbility) {
		array_push(obj_player.onStrikeAbilities, id)
		//obj_player.onStrikeAbilities[array_length(obj_player.onStrikeAbilities)] = id
	}
	
	onLevel()
}

onLevel = function () {
	show_debug_message(name + " leveled up!")
}

///@description						Adds a rune to the ability
///@param {string} _name			Name of the rune
///@param {string} _description		Description for selecting the rune
addRune = function (_name, _description) {
	var runeIndex = array_length(runes)
	
	runes[runeIndex] = {
		name: _name,
		description: _description
	}
}
