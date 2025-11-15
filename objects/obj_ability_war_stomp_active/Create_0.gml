/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited()

name = "War Stomp"
description = "Stuns and damages an area around Jonah"
selectionIcon = spr_abil_select_icon_war_stomp
active = true

iconColor = enumAbilityColor.orange

curCd = 0
maxCd = 440
treeLevel = 1
lastCast = -99

autoCast = false
canAutoCast = false

baseDamage = [25, 50, 75, 100, 100]
baseRadius = [75, 75, 75, 75, 100]
stunLength = [2, 3, 4, 4, 5]

activate_war_stomp_active(-1) // not used, ease of reference

charStatBonuses = []

statBonusAftershock = {
	stat: enumCharStats.str,
	active: false,
	amount: 30,
	name: "Aftershock",
	description: "Creates a secondary area of damage after a brief delay",
}

statBonusEchoingPain = {
	stat: enumCharStats.dex,
	active: false,
	amount: 30,
	name: "Echoing Pain",
	description: "Deals extra damage per target hit or critical if only 1 target is hit"
}

statBonusReflection = {
	stat: enumCharStats.int,
	active: false,
	amount: 30,
	name: "Reflection",
	description: "Reflects projectiles back at enemies"
}

array_push(charStatBonuses, statBonusAftershock, statBonusEchoingPain, statBonusReflection)

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

activateCustomCheck = function() {
	if (owner.sprite_index == owner.sprSlam) {
		return false
	}
	
	return true
}