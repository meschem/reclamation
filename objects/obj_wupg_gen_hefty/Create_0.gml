
event_inherited()

name = "Hefty"
description = "Increased size and damage."
active = false
stackable = true

projectileScale = [0.25]
damageScalar = [0.1]

stats = [
	new abilityStat(
		"Damage",
		"damageScalar",
		damageScalar,
        true, statUnits.percent
	),
	new abilityStat(
		"Projectile Size",
		"projectileScale", 
		projectileScale
	)
]
