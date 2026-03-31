
event_inherited()

name = "Weighted"
description = "Harder to use but packs a lot more punch."
active = false
stackable = true

damageScalar = [0.3]
bonusKnockbackScalar = [0.5]
rangeScalar = [-0.3]

stats = [
    new abilityStat(
		"Damage",
		"damageScalar", 
		damageScalar
	),
	new abilityStat(
		"Range",
		"rangeScalar",
		rangeScalar,
		true, statUnits.percent
	),
    new abilityStat(
        "Knockback",
        "knockbackScalar",
        bonusKnockbackScalar,
        true, statUnits.percent
    )
]
