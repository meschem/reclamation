/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

name = "Ebony Pendant"
description = "Emanates with a powerful, life-giving energy"

rarity = enumRarity.rare

bonusInt = 3
bonusStr = 6
bonusHealth = 30

stats = [
	new itemStat(enumItemStats.bonusHealth, [bonusHealth])
]

addCharStatBlocks()
