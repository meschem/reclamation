
event_inherited()

name = "Reinforced"
description = "Increased weapon damage and knockback, but reduced speed."
active = false
stackable = true

knockbackScalar = [0.3]
damageScalar = [0.5]
attackSpeedScalar = [-0.15]

stats = [
	new abilityStat(
		"Damage Bonus",
		"damageScalar",
		damageScalar
	),
	new abilityStat(
		"Knockback Bonus",
		"knockbackScalar",
		knockbackScalar
	),
	new abilityStat(
		"Attack Speed",
		"attackSpeedScalar",
		attackSpeedScalar
	)
]
