/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited();

name = "Flurry"
description = "Increases attack speed for a short duration. Each attack increases in size. Slows movement."
active = true
selectionIcon = spr_abil_select_icon_flurry

curCd = 0
maxCd = 600

canAutoCast = true

enabled = false
projectileCount = 5

bonusAttackSpeed = 2
bonusMoveSpeed = -0.5
bonusAttackArea = 0
duration = seconds_to_frames(1)

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
	owner.equipment.weapon.curCd = 0
	create_instance(obj_jonah_flurry_swipe_caster)
}
