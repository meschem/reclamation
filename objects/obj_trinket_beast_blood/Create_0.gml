
event_inherited()

name = "Beast Blood"
description = "Increases Attack Speed and Crit Multiplier after healing"
rarity = enumRarity.rare

duration = 10
bonusAttackSpeedOnHeal = [0.15, 0.2, 0.25, 0.3, 0.35]
bonusCritMultiplierOnHeal = [1, 1.25, 1.5, 1.75, 2]

stats = [
	new itemStat(enumItemStats.bonusAttackSpeed, bonusAttackSpeedOnHeal),
	new itemStat(enumItemStats.bonusCritMultiplier, bonusCritMultiplierOnHeal)
]

onLevelUp = function() {
	if (level == 1) {
		array_push(owner.onHealAbilities, id)
	}
}

activateOnHeal = function() {
	var _buff = create_instance(obj_buff_beast_blood)
	
	_buff.owner = owner
	_buff.timer = seconds_to_frames(duration)
	
	_buff.bonusAttackSpeed = bonusAttackSpeedOnHeal[level - 1]
	_buff.bonusCritMultiplier = bonusCritMultiplierOnHeal[level - 1]
}
