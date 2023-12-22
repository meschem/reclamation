/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited();

name = "Flurry"
description = "Increases attack speed for a short duration. Each attack increases in size. Slows movement."
active = true

icon = spr_ability_icon_flurry

curCd = 0
maxCd = 240

enabled = false
projectileCount = 5
duration = seconds_to_frames(3)

bonusAttackSpeed = 2
bonusMoveSpeed = -0.5
bonusAttackArea = 0
duration = seconds_to_frames(1.5)

treeLevel = 3

stats = [
	//new abilityStat(
	//	"Duration", "duration",
	//	[5, 5, 6, 6, 7]
	//),
	new abilityStat(
		"Attack Speed", "bonusAttackSpeed",
		[3, 3.4, 3.8, 4.2, 5]
	),
	//new abilityStat(
	//	"Size Increase", "bonusScale", 
	//	[0.1, 0.25, 0.3, 0.35, 0.5]
	//)
]

addRune("Growing Rage", "Each attack increases damage by 5")
addRune("Blood Fueled", "Kills extend duration by 0.1 seconds. Max +3 seconds.")

use = function() {
	create_instance(obj_jonah_flurry_swipe_caster)
}
