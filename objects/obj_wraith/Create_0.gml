/// @description Init

event_inherited();

xp = 100
hpMax = 20
hp = hpMax

moveAccel = 0.08
moveSpeedMax = 1.5

shadowSprite = spr_shadow_lg

floatRange = 2

moveRotationRate = 0.01
flies = true

add_loot_gold(25, 30, 0.4)

beginStep = function() {
	if (age % 20 == 0) {
		var inst = instance_create_depth(x, y, depths.enemyFloorFx, obj_wraith_fade)
		
		inst.lifeSpan = 999
		inst.singleCycle = true
		inst.image_xscale = image_xscale
		inst.image_yscale = image_yscale
	}
}
