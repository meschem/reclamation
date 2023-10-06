/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited();

name = "Flurry"
description = "Rapidly attacks in a spread pattern"
active = true

curCd = 0
maxCd = 240

enabled = false
projectileCount = 5
bonusDamage = 0

treeLevel = 2

stats = [
	new abilityStat(
		"Projectile Count", "projectileCount",
		[5, 5, 6, 6, 7]
	),
	new abilityStat(
		"Bonus Damage", "bonusDamage", 
		[0, 0, 5, 5, 10]
	)
]

addRune("Circle Flurry", "Throws 8 Hammers in a 360 degree arc")
addRune("Exertion", "I dont know")

use = function() {
	activate_flurry(level)
}
