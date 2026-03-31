
event_inherited()

name = "Sharpened"
description = "Increased weapon damage and speed."
active = false
stackable = true

damageScalar = [0.1]
attackSpeedScalar = [0.1]

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
