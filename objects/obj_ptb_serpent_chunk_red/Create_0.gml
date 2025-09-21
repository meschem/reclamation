/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

shadow = spr_shadow_lg
magInitMin = 0.8
magInitMax = 2.3
bounceRatio = 0.6
yGroundOffset = -3
zVelInitMin = -12
zVelInitMax = -9

onBounce = function() {
	instance_create_depth(x, y + 4, depths.enemyFloorFx, obj_lq_blood_splat_md)
}
