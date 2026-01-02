
event_inherited()

name = "Contoured"
description = "Increased speed, distance, and damage."
active = false
stackable = true

damageScalar = [0.1]
velocityScalar = [0.2]
rangeScalar = [0.2]

stats = [
	new abilityStat(
		"Damage",
		"damageScalar", 
		damageScalar,
		true, statUnits.percent
	),
	new abilityStat(
		"Velocity",
		"velocityScalar",
		velocityScalar,
		true, statUnits.percent
	),
	new abilityStat(
		"Range",
		"rangeScalar",
		rangeScalar,
		true, statUnits.percent
	),
]
