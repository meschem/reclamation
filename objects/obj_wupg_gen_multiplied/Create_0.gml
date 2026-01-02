
event_inherited()

name = "Multiplied"
description = "Adds extra projectiles per attack."
active = false
stackable = true

bonusProjectiles = [0.5]

stats = [
	new abilityStat(
		"Extra Projectiles",
		"bonusProjectiles", 
		bonusProjectiles
	)
]
