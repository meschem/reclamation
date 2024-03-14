
event_inherited()

name = "Wicked Talon"
description = "Attack multiple times every few attacks"

requiredAttacks = [6, 5, 4, 3, 3]
bonusAttacks = [1, 1, 1, 1, 2]

stats = [
	new itemStat(enumItemStats.custom, requiredAttacks, true, {
		displayName: "Every X Attacks",
		unitEnum: statUnits.none,
		prepend: false
	}),
	new itemStat(enumItemStats.custom, bonusAttacks, true, {
		displayName: "Bonus Attacks",
		unitEnum: statUnits.none,
		prepend: false
	})
]
