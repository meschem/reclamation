
event_inherited()

name = "Contoured"
description = "Increased speed, distance, and damage."
active = false
stackable = true

damageScalar = [0.15]
velocityScalar = [0.15]
rangeScalar = [0.5]

stats = [
	new abilityStat(
		"Damage Bonus",
		"damageScalar", 
		damageScalar,
		true, statUnits.percent
	),
	new abilityStat(
		"Velocity Bonus",
		"velocityScalar",
		velocityScalar,
		true, statUnits.percent
	),
	new abilityStat(
		"Range Bonus",
		"rangeScalar",
		rangeScalar,
		true, statUnits.percent
	),
]
