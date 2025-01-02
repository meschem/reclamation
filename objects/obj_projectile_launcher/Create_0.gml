/// @description	Launches a number of projectiles over a period of time

enum launchAngleTypes {
	attackAngle,
	movementAngle,
	staticAngle
}

age = 0
lifeSpan = stf(180)

projectile = obj_dagger
projectileCount = 3
projectileType = projectileTypes.ability

cooldown = 0
cooldownMax = 8

launchAngle = 0
launchAngleType = launchAngleTypes.staticAngle
launchVelocityMin = 3
launchVelocityMax = 4
launchForwardOffset = 6
launchOffsetVariance = 0

weapon = noone
launchInstance = noone
launchVector = new vec2()
owner = noone