
if (game_is_paused()) {
	return 0
}

ribbon.trailColor = ribbonColor

if (age < lifeSpan) {
	age++
	
	prevX = x
	prevY = calculatedY
	
	var _t = age / lifeSpan
	
	x = lerp(startX, targetX, _t)
	y = lerp(startY, targetY, _t)
	//z = lobHeight * (4 * _t * (1 - _t))
	zVel += lobGravity
	z += zVel
	
	calculatedY = y + z * zRatio
} else {
	x = targetX
	y = targetY
	z = 0
	
	if (instance_exists(itemToSpawn)) {
		itemToSpawn.spawn(x, y)
	}
	
	instance_destroy()
}
