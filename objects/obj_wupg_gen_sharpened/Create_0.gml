
event_inherited()

name = "Sharpened"
description = "Increased weapon damage and speed."
active = false
stackable = true

damageScalar = [0.25]
attackSpeedScalar = [0.15]

stats = [
	new abilityStat(
		"Damage",
		"damageScalar", 
		damageScalar,
        true, statUnits.percent
	),
	new abilityStat(
		"Attack Speed",
		"attackSpeedScalar",
		attackSpeedScalar
	)
]
