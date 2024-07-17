/// @description Init

event_inherited();

xp = 60
hpMax = 60
hp = hpMax

moveSpeedMax = baddie_move_speed_very_fast

shadowSprite = spr_shadow_lg

floatRange = 2

flies = true
phases = true

moveBehavior = enemyMoveBehaviors.simple

add_loot_gold(25, 30, 0.4)

beginStep = function() {
	if (age % 15 == 0) {
		var inst = instance_create_depth(x, y, depths.enemyFloorFx, obj_devil_fade)
		
		inst.lifeSpan = 999
		inst.singleCycle = true
		inst.image_xscale = image_xscale
		inst.image_yscale = image_yscale
		inst.image_speed = 1
	}
}