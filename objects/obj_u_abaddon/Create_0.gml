/// @description Init

event_inherited();

name = "Abaddon"

xp = baddie_xp_tough
hpMax = 400
hp = hpMax
hpBarDisplay = entityHpBarTypes.small

pushRadius = 11
pushForce = 10

deathParticles = [
	obj_ptb_skel_fly_skull,
	obj_ptb_wraith_scythe_hilt,
	obj_ptb_wraith_scythe_head,
]

moveAccel = baddie_move_accel_slow
//moveSpeedMax = baddie_move_speed_ultra_fast
moveSpeedMax = baddie_move_speed_very_fast
collidesWith = baddie_collision_flier

weight = 0

shadowSprite = spr_shadow_lg

floatRange = 2

moveRotationRate = 0.005 // not used
flies = true

add_baddie_gold_tough

outlineColor = get_color(colors.red)

add_loot(obj_ore)

beginStep = function() {
	if (age % 20 == 0) {
		var inst = instance_create_depth(x, y, depths.enemyFloorFx, obj_wraith_fade)
		
		inst.lifeSpan = 999
		inst.singleCycle = true
		inst.image_xscale = image_xscale
		inst.image_yscale = image_yscale
	}
}
