
event_inherited()

name = "Attack Speed Boost"
description = "Increased attack speed."
active = false
stackable = true

attackSpeedScalar = [0.25]

stats = [
	new abilityStat(
		"Attack Speed Bonus",
		"attackSpeedScalar", 
		attackSpeedScalar
	),
	new abilityStat(
		"Not a Real Stat",
		"test",
		[1]
	)
]
