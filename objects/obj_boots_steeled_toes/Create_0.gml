
event_inherited()

slot = equipmentSlots.boots

bonusHealth = [10, 20]
bonusInvulnFrames = 30

maxLevel = 2
rarity = enumRarity.magic

name = "Steeled Toes"
description = "Hefty, defensive boots. Increases invuln after taking damage."
cost = 500

onEquip = function() {
	owner.invulnFrames += bonusInvulnFrames
}

onUnequip = function() {
	owner.invulnFrames -= bonusInvulnFrames
}