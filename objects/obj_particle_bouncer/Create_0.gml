/// @description Init

event_inherited()

lifeSpan = random_range(400, 600)
age = 0

xVel = 0
yVel = 0
zVel = -4
zVelMax = 100

deaccel = 0

yGroundOffset = -6
zOffset = yGroundOffset - 2

gravAccel = 0.3

bounceRatio = 0.7
frictionRatio = 0.7
moving = true

lateralSpeed = 0
minBounceVelocity = 1.4

shadow = spr_shadow_med
shadowOffset = 0
singleCycle = false

firstBounce = true
bounces = 0
maxBounces = -1

rotationSpeedInit = 1
rotationSpeedInitMin = 3
rotationSpeedInitMax = 12
rotationSpeed = 1
rotationSpeedMax = 15
rotationSpeedMin = 0.5
rotationSpeedDeaccel = 0

//Init props
magInitMin = 0.4			// Min speed, set on particle obj
magInitMax = 2.4			// Max speed, set on particle obj
angleInitVariance = 20
zVelInitMin = -6			// Multiplied by magMultiplier
zVelInitMax = -3

reflectOffsetY = 6

angleInit = 0				// Should be set by incoming damage
magMultiplier = 1			// Should be set by incoming damage

onFirstBounce = function() {}
onBounce = function() {}
beginStep = function() {}

applyInitialProps = function() {
	var _angle = angleInit + random_range(-angleInitVariance, angleInitVariance)
	var _mag = magMultiplier * random_range(magInitMin, magInitMax)
	var _velocity = get_vec2_from_angle_mag(_angle, _mag)
	
	xVel = _velocity.x
	yVel = _velocity.y
	zVel = (magMultiplier * 0.5) * random_range(zVelInitMin, zVelInitMax)
	zOffset = yGroundOffset - 2
	
	rotationSpeed = clamp(
		random_range(rotationSpeedInitMin, rotationSpeedInitMax),
		-rotationSpeedMax,
		rotationSpeedMax
	)
	
	if (random(1) > 0.5) {
		rotationSpeed *= -1
	}
}