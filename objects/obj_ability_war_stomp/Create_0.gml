/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited()

name = "War Stomp"
description = "Stuns and damages an area around Jonah\nStr Boosts"
selectionIcon = spr_abil_select_icon_war_stomp
active = true

curCd = 0
maxCd = 440
treeLevel = 1

autoCast = true
canAutoCast = true

baseDamage = [10, 15, 30, 40, 50]
baseRadius = [70, 100, 100, 100, 130]
stunLength = [2, 3, 4, 4, 5]

stats = [
	new abilityStat(
		"Damage",
		"baseDamage",
		baseDamage
	),
	new abilityStat(
		"Radius",
		"baseRadius",
		baseRadius
	),
	new abilityStat(
		"Stun Length",
		"stunLength",
		stunLength
	)
]

addRune("Aftershock", "After a short period of time, a second stomp hits.")
addRune("Pushback", "Knocks targets back a distance")
addRune("Echo Slam", "Deals 10% more damage the more targets that are hit")

use = function() {
	owner.sprite_index = owner.sprSlam
	owner.image_index = 0
}
