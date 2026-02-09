///@description		Setup

// Inherit the parent event
event_inherited()

name = "Shadowstep"
description = "Dash in a direction and briefly gain move and attack speed."
//onHitAbility = true
active = true
//selectionIcon = spr_abil_select_icon_bear_trap
treeLevel = 2

curCd = 0
maxCd = seconds_to_frames(5)

autoCast = false
canAutoCast = false

attackSpeedScalar = [0.5, 0.5, 0.75, 0.75, 1]
moveSpeedScalar = [0.4, 0.6, 0.6, 0.8, 0.8]
cooldown = [
	seconds_to_frames(8),
	seconds_to_frames(8),
	seconds_to_frames(7),
	seconds_to_frames(7),
	seconds_to_frames(6),
]

buffDuration = seconds_to_frames(2)
distance = 110
invulnSeconds = 1

addRune("Remnant of Ire", "Creates a ghostly remnant that draws aggression for a brief time. Double cooldown.")
addRune("Strafeshot", "Shoots 8 projectiles in a circle around you upon dashing.")

stats = [
	new abilityStat(
		"Cooldown", "curCd", cooldown, true, statUnits.seconds
	),
	new abilityStat(
		"Attack Speed Bonus", "attackSpeedScalar", attackSpeedScalar, true, statUnits.percent
	),
	new abilityStat(
		"Move Speed Bonus", "moveSpeedScalar", moveSpeedScalar, true, statUnits.percent
	)
]

use = function () {
	buff_player_invuln(invulnSeconds)
	
	var _inst = create_instance(obj_buff_shadowstep)
	_inst.owner = owner
	_inst.bonusMoveSpeed = moveSpeedScalar[level - 1]
	_inst.bonusAttackSpeed = attackSpeedScalar[level - 1]
	_inst.timer = buffDuration
	
	_inst.applyFx()
	
	//owner.image_alpha = 0.5
	
	player_blink_in_direction(owner.moveAngle, distance, owner)
	
	
}
