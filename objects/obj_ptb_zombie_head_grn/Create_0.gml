/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

shadow = spr_shadow_lg
magInitMin = 0.3
magInitMax = 2
bounceRatio = 0.5
yGroundOffset = -4
zVelInitMin = -10
zVelInitMax = -8

onBounce = function() {
	instance_create_depth(x, y + 4, depths.enemyFloorFx, obj_lq_blood_splat_md)
}
