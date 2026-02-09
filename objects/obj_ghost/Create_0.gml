/// @description Init

event_inherited();

name = "Ghost"

xp = baddie_xp_fodder
hpMax = baddie_hp_low
hp = hpMax

pushRadius = 8
pushForce = 9

deathParticles = [
	obj_ptb_skel_fly_skull,
	obj_ptb_wraith_scythe_hilt,
	obj_ptb_wraith_scythe_head,
]

moveAccel = baddie_move_accel_med
moveSpeedMax = baddie_move_speed_fast
collidesWith = baddie_collision_flier

weight = 0

shadowSprite = spr_shadow_lg

floatRange = 2

moveRotationRate = 0.005 // not used
flies = true

//beginStep = function() {
//	if (age % 20 == 0) {
//		var inst = instance_create_depth(x, y, depths.enemyFloorFx, obj_wraith_fade)
		
//		inst.lifeSpan = 999
//		inst.singleCycle = true
//		inst.image_xscale = image_xscale
//		inst.image_yscale = image_yscale
//	}
//}
