///@description Ability parent setup

persistent = true

name = "No Name"
description = "No description yet"

icon = spr_ability_icon_null
icon = sprite_index
iconX = -999
iconY = -999

image_alpha = 0

autoCast = false
canAutoCast = false
enabled = false
onHitAbility = false
onStrikeAbility = false
active = false
curCharges = 1
maxCharges = 1
owner = obj_player.id
ultimate = false
hotkeySet = false

age = 0

level = 0
maxLevel = 4

curCd = 300
maxCd = 300

baseCdModifier = 1

activationCdCur = 0
activationCdMax = 0

treeLevel = 2
hotkey = -1
controllerIcon = spr_btn_xbox_y
kbIcon = spr_btn_kb_shift

selectionIcon = spr_abil_select_icon_unset

owner = obj_player.id // get_player_target()
drawGui = true

runes = []

tags = []

charStatBonuses = []

resetCooldown = function () {
	var cdModifier = max(maxCd * baseCdModifier, 0.25)

	curCd = cdModifier * owner.abilityCooldownScalar
}

stats = []

///@return {bool}
canActivate = function() {
	if (!active)
		return false
	
	if (curCharges <= 0)
		return false
		
	if (activationCdCur > 0)
		return false
		
	if (ultimate && !owner.canUseUltimate())
		return false
		
	if (!validateUse()) {
		return false
	}
	
	if (!activateCustomCheck()) {
		return false
	}
	
	return true
}

activateCustomCheck = function() {
	return true
}

activate = function() {
	if (curCharges == maxCharges) {
		resetCooldown()
	}
	
	activationCdCur = activationCdMax * owner.abilityCooldownScalar

	curCharges--
	
	if (ultimate) {
		owner.ultimateChargeDelay = owner.ultimateChargeDelayMax
		owner.ultimateCharge = 0
	}
	
	use()
	
	var _ability = id
	var _owner = owner
	
	with (obj_equipment) {
		if (equipped && owner == _owner) {
			onAbilityUse(_ability)
		}
	}
}


///@description				Used to validate use. If validation fails, will not use CD
///@return {bool}
validateUse = function() {
	return true
}

activateOnHit = function(_hitBy) {
	show_message("activateOnHit() not set on ability object")
}

use = function() {
	show_message("use() not set on ability object")
}

applyStats = function () {
	for (var i = 0; i < array_length(stats); i++) {
		
			variable_instance_set(id, stats[i].variable, stats[i].values[level - 1])
		
	}
}

levelUp = function () {
	level++
	
	enabled = true
	
	if (level == 1) {
		array_push(owner.abilities, id)
		
		if (ultimate) {
			
			owner.ultimateAbility = id
			kbIcon = spr_btn_kb_t
		}
		
		treeLevel = array_length(owner.abilities)
	}
	
	iconX = 1 + (26 * (treeLevel - 1))
	iconY = 42
	
	if (active) {
		owner.activeAbilities[treeLevel - 1] = id
	}
	
	if (level == 1) {
		if (onHitAbility) {
			array_push(owner.onHitAbilities, id)
			//obj_player.onHitAbilities[array_length(obj_player.onHitAbilities)] = id
		}
	
		if (onStrikeAbility) {
			array_push(owner.onStrikeAbilities, id)
			//obj_player.onStrikeAbilities[array_length(obj_player.onStrikeAbilities)] = id
		}
	
		if (ultimate) {
			owner.hasUltimate = true
			obj_ui_controller.drawUltimateBar = true
		}
	}
	
	//applyStats()
	
	onLevel()
}

///@description						Occurs after level has been incremented
onLevel = function () {
	show_debug_message(name + " leveled up to " + string(level))
}

///@description						Adds a rune to the ability
///@param {string} _name			Name of the rune
///@param {string} _description		Description for selecting the rune
addRune = function (_name, _description) {
	var runeIndex = array_length(runes)
	
	runes[runeIndex] = {
		name: _name,
		description: _description,
		enabled: false,
		ability: id
	}
}

///@description						Enables a rune
///@param {real} index				Index. Can use enumRunes
enableRune = function (index) {
	runes[index].enabled = true
	
	applyRune(index)
	
	show_debug_message("Rune Enabled: " + runes[index].name)
}

///@description						Enables all runes for the ability
enableAllRunes = function () {
	for (var i = 0; i < array_length(runes); i++) {
		enableRune(i)
	}
}

///@description						Ability-specific actions on addition of a rune.
///									Intended for updated obj_ability properties
///@param {real} rune				Rune that is being applied
applyRune = function(rune) {
	
}

///@description						Gets available runes to be leveled
///@return {array<Any>}
getAvailableRunes = function() {
	var availableRunes = []
	
	for (var i = 0; i < array_length(runes); i++) {
		if (!runes[i].enabled) {
			array_push(availableRunes, runes[i])
		}
	}
	
	return availableRunes
}
