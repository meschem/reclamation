/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

name = "Pinion of War"
description = "A feather brimming with power, touched by the burning heavens above."

rarity = enumRarity.legendary
bonusInt = 20
bonusStr = 10
bonusMoveSpeed = 0.5

addCharStatBlocks()

array_push(stats, new itemStat(enumItemStats.bonusMoveSpeed, [bonusMoveSpeed]))
