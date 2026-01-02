
event_inherited()

name = "Weighted"
description = "Harder to use but packs a lot more punch."
active = false
stackable = true

damageScalar = [0.5]
attackSpeedScalar = [-0.25]
bonusKnockbackScalar = [0.5]

stats = [
    new abilityStat(
		"Damage",
		"damageScalar", 
		damageScalar
	),
	new abilityStat(
		"Attack Speed",
		"attackSpeedScalar",
		attackSpeedScalar
	),
    new abilityStat(
        "Knockback",
        "knockbackScalar",
         bonusKnockbackScalar,
        true, statUnits.percent
    )
]
