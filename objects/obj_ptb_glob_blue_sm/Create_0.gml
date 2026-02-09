// Inherit the parent event
event_inherited()

magInitMin = 1
magInitMax = 3
bounceRatio = 0.6
yGroundOffset = -2
zVelInitMin = -9
zVelInitMax = -6.5

onBounce = function() {
	instance_create_depth(x, y + 4, depths.enemyFloorFx, obj_lq_slime_splat_blue_md)
	instance_destroy()
}
