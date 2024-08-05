
event_inherited()

name = "Rapid Swings"
description = "Adds extra swings per attack."
active = false
stackable = true

bonusProjectiles = [1]
bonusDamage = [-0.25]

stats = [
	new abilityStat(
		"Extra Projectiles",
		"bonusProjectiles", 
		bonusProjectiles
	),
	new abilityStat(
		"Bonus Damage",
		"bonusDamage",
		bonusDamage
	)
]
