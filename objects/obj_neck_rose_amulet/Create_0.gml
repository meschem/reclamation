
event_inherited()

slot = equipmentSlots.neck
icon = spr_inv_icon_neck
iconSpriteIndex = 2

name = "Rose Amulet"
description = "Fully heals on purchase."
cost = 1200
rarity = enumRarity.magic

addRandomStats()

onEquip = function() {
	owner.hp = owner.maxHp
}