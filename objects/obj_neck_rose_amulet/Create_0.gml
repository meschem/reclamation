
event_inherited()

slot = equipmentSlots.neck

name = "Rose Amulet"
description = "Fully heals on purchase."
cost = 1200
rarity = enumRarity.magic

addRandomStats()

onEquip = function() {
	owner.hp = owner.maxHp
}