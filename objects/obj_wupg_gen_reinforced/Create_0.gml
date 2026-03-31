
event_inherited()

name = "Reinforced"
description = "Increased weapon knockback."
active = false
stackable = true

knockbackScalar = [0.25]

stats = [
	new abilityStat(
		"Knockback",
		"knockbackScalar",
		knockbackScalar
	)
]
