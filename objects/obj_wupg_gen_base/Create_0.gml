
event_inherited()

name = "Sharpen"
description = "Increased weapon damage and speed."
active = false
stackable = true

damageScalar = [0.25]
attackSpeedScalar = [0.25]
bonusAoeScalar = [0.25]
bonusKnockback = [0.25]
bonusCritMultiplier = [0.25]

baseDamage = [5]

stats = [
	new abilityStat(
		"Damage Bonus",
		"damageScalar", 
		damageScalar
	),
	new abilityStat(
		"Attack Speed Bonus",
		"attackSpeedScalar",
		attackSpeedScalar
	)
]
