/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

name = "Black Ichor"
description = "A thick, deeply dark substance."

bonusAbilityDamage = 0.15
bonusAbilityCooldown = 0.15
doubleCastChance = 0.1
doubleCastDelay = 10

statsSpecial = ["10% chance for double-cast for passive abilities on Cast"]

onAbilityUse = function(_ability) {
	if (!_ability.canAutoCast) {
		return 0
	}
	
	var _runningDelay = doubleCastDelay
	var _castDelay = doubleCastDelay

	if (random(1) < doubleCastChance) {
		with (obj_double_caster) {
			if (ability == _ability) {
				_runningDelay += _castDelay
			}
		}
		
		var _caster = create_instance(obj_double_caster)
		_caster.ability = _ability
		_caster.castDelay = _runningDelay
	}
}
