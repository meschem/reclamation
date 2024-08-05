
event_inherited()

name = "Sharpen"
description = "Increased weapon damage and speed."
active = false
stackable = true

damageScalar = [0.3]
attackSpeedScalar = [0.15]

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
