
event_inherited()

name = "Venomleaf"
description = "Dangerous to consume, but far more to harvest."

bonusDex = 1
bonusPoisonDamage = 5

addCharStatBlocks()

array_push(stats, new itemStat(enumItemStats.bonusPoisonDamage, [bonusPoisonDamage]))
