
event_inherited()

name = "Beast Blood"
description = "A boiled-down mixture from carefully selected prey."

bonusStr = 1
bonusDex = 1
bonusInt = 1

bonusPoisonDamage = 15

addCharStatBlocks()

array_push(stats, new itemStat(enumItemStats.bonusPoisonDamage, [bonusPoisonDamage]))
