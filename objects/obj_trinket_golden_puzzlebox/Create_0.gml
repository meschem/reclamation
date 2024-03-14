
event_inherited()

name = "Golden Puzzlebox"
description = "Damages random enemy upon picking up gold. Coin stacks deal critical damage."
maxLevel = 5

damageDirect = [10, 15, 20, 25, 30]

stats = [
	new itemStat(enumItemStats.custom, damageDirect, true, {
		displayName: "Damage",
		unitEnum: statUnits.none
	})
]
