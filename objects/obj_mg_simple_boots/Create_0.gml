// Inherit the parent event
event_inherited()

name = "Simple Boots"
description = "Humble boots for quick-footed warriors."

bonusMoveSpeed = 0.05

array_push(stats, new itemStat(enumItemStats.bonusMoveSpeed, [bonusMoveSpeed]))
