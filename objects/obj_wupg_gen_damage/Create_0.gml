
event_inherited()

name = "Damage Boost"
description = "Increased weapon damage."
active = false
stackable = true

damageScalar = [0.25]

stats = [
	new abilityStat(
		"Damage Bonus",
		"damageScalar", 
		damageScalar
	)
]
