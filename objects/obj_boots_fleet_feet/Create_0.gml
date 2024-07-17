
event_inherited()

slot = equipmentSlots.boots
icon = spr_inv_icon_boots
iconSpriteIndex = 4

//bonusHealth = [10, 20, 30]
//bonusMoveSpeed = [2, 2.5, 3]
cdReduction = 0.3

maxLevel = 3
rarity = enumRarity.legendary

name = "Fleet Feet"
description = "Lowers cooldown of movement abilities."
cost = 1200

addRandomStats()

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