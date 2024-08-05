
event_inherited()

name = "Hefty"
description = "Increased size and damage."
active = false
stackable = true

bonusAoeScalar = [0.35]
damageScalar = [0.15]

stats = [
	new abilityStat(
		"Damage Bonus",
		"damageScalar",
		damageScalar
	),
	new abilityStat(
		"Weapon Size Bonus",
		"bonusAoeScalar", 
		bonusAoeScalar
	)
]
