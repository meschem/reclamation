if (game_is_paused()) {
	return 0
}

cooldown--

age++

if (age > lifeSpan) {
	create_toaster("Launcher killed after 3min")
	instance_destroy()
	return 0
}

if (cooldown > 0) {
	return 0
}

cooldown = cooldownMax

projectileCount--

if (launchInstance != noone) {
	if (!instance_exists(launchInstance)) {
		instance_destroy()
		
		return 0
	}
	
	launchVector.x = launchInstance.x
	launchVector.y = launchInstance.y
}

var angle = launchAngle
var forwardOffset = get_vec2_from_angle_mag(angle, launchForwardOffset)
var launchX = launchVector.x + random_range(-launchOffsetVariance, launchOffsetVariance) + forwardOffset.x
var launchY = launchVector.y + random_range(-launchOffsetVariance, launchOffsetVariance) + forwardOffset.y

switch (launchAngleType) {
	case launchAngleTypes.attackAngle:
		angle = launchInstance.attackAngle
	break
	
	case launchAngleTypes.movementAngle:
		angle = get_angle(launchInstance.xVel, launchInstance.yVel)
	break
}

var velocity = random_range(launchVelocityMin, launchVelocityMax)
var instance = noone

switch (projectileType) {
	case projectileTypes.weapon:
		instance = launch_projectile_player_weapon(
			projectile,
			angle,
			velocity,
			launchX,
			launchY,
			weapon
		)
	break
	
	case projectileTypes.ability:
	
	//break
	
	case projectileTypes.enemy:
		instance = launch_projectile_from_point(
			projectile,
			angle,
			velocity,
			launchX,
			launchY,
			owner
		)
	break
}

if (projectileCount <= 0) {
	instance_destroy()
}