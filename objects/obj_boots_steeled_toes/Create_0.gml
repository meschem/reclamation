
event_inherited()

slot = equipmentSlots.boots
icon = spr_inv_icon_boots
iconSpriteIndex = 2

//bonusHealth = [10, 20]
bonusInvulnFrames = 30

maxLevel = 2
rarity = enumRarity.magic

name = "Steeled Toes"
description = "Increases invuln after taking damage."
cost = 500

addRandomStats()

onEquip = function() {
	owner.invulnFrames += bonusInvulnFrames
}

onUnequip = function() {
	owner.invulnFrames -= bonusInvulnFrames
}