
event_inherited()

name = "Wake"
description = "Creates a damaging wake in front of the hammer that deals knockback and magic damage"

upgradeType = weaponUpgradeTypes.major

unlockedUpgrades = [
    obj_wupg_wh_wake_md
]

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
        20
    )
]
