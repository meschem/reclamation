if (game_is_paused()) return 0

age++

if (lifeSpan > 0) {
	if (age >= lifeSpan) {
		instance_destroy()
		return 0	
	}
}

if (distanceMax > 0) {
	distanceTraveled += distancePerFrame

	if (distanceTraveled > distanceMax) {
		instance_destroy()
		return 0
	}
}
	
if (angleSpriteToVelocity)
	image_angle = get_angle(xVel, yVel)
	
var target = instance_place(x, y, obj_baddie)

if (target != noone) {
	//audio_play_sound(soundOnHit, 1, false)
	
	onCollideFx()
	
	var critHit = (critChance > random(1))
	var damage = critHit ? damageDirect * 2 : damageDirect
	var killed = damage_baddie(target, damage, critHit) //target.hp -= damageDirect

	if (!killed && knockback > 0) {
		var pushAngle = point_direction(0, 0, xVel, yVel)
		knockback_baddie(target, knockback, pushAngle)
	}
	
	targetsHit++
	
	if (targetsHit >= targetsMax) {
		var shockwaveLevel = obj_game_controller.talents[talentList.shockwave][talentProps.curLevel]
		
		if (shockwaveLevel > 0) activate_shockwave(shockwaveLevel, x, y, get_angle(xVel, yVel))

		instance_destroy()
		return 0
	}
}

x += xVel
y += yVel

depth = depths.playerProjectile - y
