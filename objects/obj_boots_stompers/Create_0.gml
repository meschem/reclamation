
event_inherited()

slot = equipmentSlots.boots

//bonusMoveSpeed = [0.1, 0.1]

maxLevel = 2

name = "Storm Stompers"
description = "Creates thundering stomps."
cost = 800
rarity = enumRarity.rare

addRandomStats()

travelDistance = 0
travelDistanceMax = 250
damageRadius = 75
damage = [30, 45]

lastX = -1
lastY = -1

onEquip = function() {
	lastX = owner.x
	lastY = owner.y
}