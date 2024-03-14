
event_inherited()

name = "Knockback boost"
description = "Increased weapon knockback."
active = false
stackable = true

knockbackScalar = [0.3]

stats = [
	new abilityStat(
		"Knockback Bonus", "knockbackScalar",
		knockbackScalar
	)
]

