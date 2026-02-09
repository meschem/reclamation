// Inherit the parent event
event_inherited()

magInitMin = 0.4
magInitMax = 2.2
bounceRatio = 0.6
yGroundOffset = -2
zVelInitMin = -9
zVelInitMax = -6.5

maxBounces = 0

onBounce = function() {
	instance_create_depth(x, y + 4, depths.enemyFloorFx, obj_lq_slime_splat_md)
	instance_destroy()
}
