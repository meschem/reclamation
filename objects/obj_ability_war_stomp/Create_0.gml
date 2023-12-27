/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited();

name = "War Stomp"
description = "Stuns and damages an area around Jonah"
selectionIcon = spr_abil_select_icon_war_stomp
active = true

curCd = 0
maxCd = 440
treeLevel = 1

baseDamage = 10
baseRadius = 5
stunLength = 2

stats = [
	new abilityStat(
		"Damage", "baseDamage", 
		[10, 14, 18, 22, 30]
	),
	new abilityStat(
		"Radius", "baseRadius", 
		[70, 80, 80, 80, 90]
	),
	new abilityStat(
		"Stun Length", "stunLength", 
		[2, 2, 3, 3, 4]
	)
]

addRune("Aftershock", "After a short period of time, a second stomp hits.")
addRune("Pushback", "Knocks targets back a distance")
addRune("Echo Slam", "Deals more damage the more targets that are hit")

use = function() {
	owner.sprite_index = owner.sprSlam
	owner.image_index = 0
	
	//animAbilityQueue = activate_war_stomp(level)
}
