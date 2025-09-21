// Inherit the parent event
event_inherited()

name = "Frost Walkers"
description = "Permeates a deep cold through the earth itself."

bonusMoveSpeed = 0.1

statsSpecial = [
	"Creats a Frost Aura that slows nearby enemies."
]

array_push(stats, new itemStat(enumItemStats.bonusMoveSpeed, [bonusMoveSpeed]))
