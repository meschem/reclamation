event_inherited()

moveSpeedMax = 5
accel = 0

angleSet = false
facingAngle = 0

image_xscale = 2
image_yscale = 2

beginStep = function() {
	if (age > 0 && age % 40 == 0) {
		var _inst = noone
		
		facingAngle = get_angle(xVel, yVel)
		angleSet = true
		
		_inst = instance_create_depth(x, y, depths.enemyProjectile, obj_enemy_blue_shot)
		_inst.yVel = -1
		_inst.xVel = 0
		
		_inst = instance_create_depth(x, y, depths.enemyProjectile, obj_enemy_blue_shot)
		_inst.yVel = 0
		_inst.xVel = sign(-xVel)
	}
}
