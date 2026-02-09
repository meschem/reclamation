///@description		Init
event_inherited()

name = "Wicked Talon"
description = "Attack multiple times every few attacks"

requiredAttacks = [4, 3, 3, 2]
bonusAttacks = [1, 1, 2, 2]
maxLevel = 4

curAttack = 0
attackDelay = 0.15

stats = [
	new itemStat(enumItemStats.custom, requiredAttacks, true, {
		displayName: "Every X Attacks",
		unitEnum: statUnits.none,
		prepend: false
	}),
	new itemStat(enumItemStats.custom, bonusAttacks, true, {
		displayName: "Bonus Attacks",
		unitEnum: statUnits.none,
		prepend: false
	})
]

onLevelUp = function() {
	if (level == 1) {
		array_push(owner.onAttackAbilities, id)
	}
}

///@description								Activate on attack
///@param {bool} _baseAttack				True if this was activated by player vs an ability or trinket
activateOnAttack = function(_baseAttack = true) {
	if (!_baseAttack) {
		return 0
	}
	
	curAttack++
	
	if (curAttack >= requiredAttacks[level - 1]) {
		var _inst, i
		
		for (i = 0; i < bonusAttacks[level - 1]; i++) {
			_inst = create_instance(obj_buff_attack_echo)
		
			_inst.owner = owner
			_inst.attackAngle = owner.attackAngle
			_inst.timer = seconds_to_frames(attackDelay * (i + 1))
		}
		
		curAttack = 0
	}
}
