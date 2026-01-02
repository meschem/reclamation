
event_inherited()

name = "Focused"
description = "Narrows projectile spread and increases damage."
active = false
stackable = true

damageScalar = [0.25]
spreadScalar = [-0.4]
maxLevel = 2

stats = [
	new abilityStat(
		"Damage",
		"damageScalar",
		damageScalar,
        true, statUnits.percent
	),
	new abilityStat(
		"Spread",
		"spreadScalar",
		spreadScalar,
		true, statUnits.percent
	)
]
