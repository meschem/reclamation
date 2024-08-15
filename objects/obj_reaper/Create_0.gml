/// @description Init

event_inherited();

name = "Reaper"

xp = 100
hpMax = 100
hp = hpMax
hpBarDisplay = baddieHpBarTypes.small

pushRadius = 11
pushForce = 10

moveAccel = baddie_move_accel_slow
//moveSpeedMax = baddie_move_speed_ultra_fast
moveSpeedMax = baddie_move_speed_very_fast
collidesWith = baddie_collision_flier

weight = 0

shadowSprite = spr_shadow_lg

floatRange = 2

moveRotationRate = 0.005 // not used
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
