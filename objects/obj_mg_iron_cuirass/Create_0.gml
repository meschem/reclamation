/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

name = "Iron Cuirass"
description = "A strong plate of armor with good motion."

bonusStr = 10
bonusHealth = 2

addCharStatBlocks()

array_push(stats, new itemStat(enumItemStats.bonusHealth, [bonusHealth]))
