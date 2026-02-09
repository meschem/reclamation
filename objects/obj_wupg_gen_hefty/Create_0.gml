
event_inherited()

name = "Hefty"
description = "Increased size and damage."
active = false
stackable = true

bonusAoeScalar = [0.5]
damageScalar = [0.25]

stats = [
	new abilityStat(
		"Damage",
		"damageScalar",
		damageScalar,
        true, statUnits.percent
	),
	new abilityStat(
		"Projectile Size",
		"bonusAoeScalar", 
		bonusAoeScalar
	)
]
