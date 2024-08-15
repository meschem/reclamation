/// @description Init

event_inherited()

name = "Wraith (Swarm)"

xp = baddie_xp_tough / 1.5
hpMax = 40
hp = hpMax

moveSpeedMax = baddie_move_speed_very_fast_plus
collidesWith = baddie_collision_flier
hpBarDisplay = baddieHpBarTypes.small

shadowSprite = spr_shadow_lg

floatRange = 2

flies = true
phases = true

moveBehavior = enemyMoveBehaviors.simple

add_baddie_gold_tough

//beginStep = function() {
//	if (age % 20 == 0) {
//		var inst = instance_create_depth(x, y, depths.enemyFloorFx, obj_wraith_fade)
		
//		inst.lifeSpan = 999
//		inst.singleCycle = true
//		inst.image_xscale = image_xscale
//		inst.image_yscale = image_yscale
//	}
//}
