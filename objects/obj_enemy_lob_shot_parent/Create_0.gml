///@description				Init
event_inherited()

damageOnCollide = false
destroyOnHit = false

zVel = 3
zVelMax = 5.25

zVelMinDistance = 50
zVelMaxDistance = 275

z = 1
moveSpeedMax = 10
gravityAccel = 0.01

useZAxis = true

damageRadius = 32
damageDirect = 10
drawTargetX = -99
drawTargetY = -99
drawTargetComplete = false
drawTargetObject = obj_projectile_warning

shadow = spr_shadow_med

scaleProjectile = true

///@description				Sets xVel and yVel appropriately based on target
///@param {real} targetX
///@param {real} targetY
calculateVelocity = function(targetX, targetY) {
	var _z = z	
	var _zVel = 0
	var totalFrames = 0
	var distance = point_distance(x, y, targetX, targetY)
	var angle = point_direction(x, y, targetX, targetY)
	
	if (distance < zVelMinDistance) {
		_zVel = zVel
	} else if (distance >= zVelMaxDistance) {
		_zVel = zVelMax
	} else {
		var _normalized = (distance - zVelMinDistance) / (zVelMaxDistance - zVelMinDistance)
		_zVel = zVel + (_normalized * (zVelMax - zVel))
				//show_message([distance, _normalized])
	}
	
	zVel = _zVel
	
	while (_z > 0) {
		_zVel -= gravAccel
		_z += _zVel
		
		totalFrames++
		
		if (totalFrames > 5000) {
			show_error("Sanity limit exceeded for calc velocity on lob shot", true)
		}
	}
	
	var desiredMag = distance / totalFrames	
	
	moveSpeedMax = min(desiredMag, moveSpeedMax)

	xVel = get_angle_xvel(angle) * moveSpeedMax
	yVel = get_angle_yvel(angle) * moveSpeedMax
	
	//moveSpeedMax = min(desiredMag, 1)
	
	//var inst = instance_create_depth(targetX, targetY, depths.fx, obj_debug_vis)
	
	//inst = instance_create_depth(x, y, depths.fx, obj_debug_vis)
	//inst.sprite_index = spr_debug_arrow
	//inst.image_angle = angle
	
	//inst = instance_create_depth(x + (xVel * 20), y + (yVel * 20), depths.fx, obj_debug_vis)
	//inst.sprite_index = spr_debug_arrow
	//inst.image_angle = angle
	
	//inst = instance_create_depth(x + (xVel * 40), y + (yVel * 40), depths.fx, obj_debug_vis)
	//inst.sprite_index = spr_debug_arrow
	//inst.image_angle = angle
}
