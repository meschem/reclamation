
event_inherited()

slot = equipmentSlots.boots

bonusHealth = [10, 20, 30]
bonusMoveSpeed = [2, 2.5, 3]
cdReduction = 0.3

maxLevel = 3
rarity = enumRarity.legendary

name = "Fleet Feet"
description = "Make you move wicked fast. Lowers cooldown of movement abilities."
cost = 1200

onEquip = function() {
	var abilities = get_abilities_with_tag(abilityTags.movement)
	
	for (var i = 0; i < array_length(abilities); i++) {
		abilities[i].baseCdModifier -= cdReduction
	}
}

onUnequip = function() {
	var abilities = get_abilities_with_tag(abilityTags.movement)
	
	for (var i = 0; i < array_length(abilities); i++) {
		abilities[i].baseCdModifier += cdReduction
	}
}