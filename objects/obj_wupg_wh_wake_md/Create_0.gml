
event_inherited()

name = "Greater Wake"
description = "Creates a second damaging wake."

upgradeType = weaponUpgradeTypes.major

stats = [
	new abilityStat(
		"Wakes", "wakes",
		1, false
	),
    new abilityStat(
		"Knockback Pct", "",
		0.3, 
	),
    new abilityStat(
        "Lightning Dmg", "",
        30
    )
]
