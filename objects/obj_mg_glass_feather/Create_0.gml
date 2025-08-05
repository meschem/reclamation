/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

name = "Glass Feather"
description = "Fused with magic that can be uniquely bound to glass."

rarity = enumRarity.magic
bonusInt = 5
bonusStr = 3
bonusMoveSpeed = 0.1

addCharStatBlocks()

array_push(stats, new itemStat(enumItemStats.bonusMoveSpeed, [bonusMoveSpeed]))
