
age = 0
lifeSpan = 360

xVel = 0
yVel = 0
zVel = 0

z = 0

useZAxis = false

gravAccel = 0.15

bounceRatio = 0.8
frictionRatio = 0.8
minBounceVelocity = 0.25
maxBounces = 0
//moving = true
//lateralSpeed = 0

shadow = spr_shadow_med

damageOnHit = 10

beingSummoned = false
summoningCdMax = 90
summoningCd = 0

accel = 0.2
moveSpeedMax = 5
turnRate = 1
velocity = 0

markForDestroy = false

target = get_player_target()

onInstanceCollision = function(inst) {
	instance_destroy()
}