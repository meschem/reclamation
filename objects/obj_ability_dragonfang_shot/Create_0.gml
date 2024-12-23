///@description		Init

// Inherit the parent event
event_inherited()

name = "Dragonfang Shot"
description = "Fires a powerful shot that bounces off of walls, dealing huge damage."
//selectionIcon = spr_abil_select_icon_war_stomp
active = true
//ultimate = true

curCd = 0
maxCd = 60
treeLevel = 1

autoCast = false
canAutoCast = false

radius = 80
baseDamage = [300, 400, 500]
damageScalarPerBounce = [2, 1.2, 1.4]
maxBounces = [4, 6, 8]
maxLevel = 3

velocity = 9

stats = [
	new abilityStat(
		"Damage",
		"baseDamage",
		baseDamage
	),
	new abilityStat(
		"Max Bounces",
		"swordCount",
		maxBounces
	),
	new abilityStat(
		"Damage Per Bounce",
		"damageScalarPerBounce",
		damageScalarPerBounce
	)
]

use = function() {
	var _angle = owner.attackAngle
	var _inst = instance_create_depth(owner.x, owner.y, depths.playerProjectile, obj_dragonfang_arrow)
	
	_inst.owner = owner
	_inst.damageDirect = baseDamage[level - 1]
	_inst.baseDamage = _inst.damageDirect
	_inst.damageScalarPerBounce = damageScalarPerBounce[level - 1]
	_inst.bouncesMax = maxBounces[level - 1]
	
	audio_play_sound(snd_crossbow_loose, 0, false)
	
	set_velocity_from_angle(_inst, _angle, velocity)
}
