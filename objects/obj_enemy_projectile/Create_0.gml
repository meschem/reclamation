
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

shadowSprite = spr_shadow_enemy_shot_basic
shadowOffset = 12

damageOnCollide = true
damageOnHit = 10

beingSummoned = false
summoningCdMax = 90
summoningCd = 0

feetOffset = 13

accel = 0.2
moveSpeedMax = 5
turnRate = 1
velocity = 0

destroyOnHit = true
markForDestroy = false

target = get_player_target()

onInstanceCollision = function(inst) {
	if (destroyOnHit) {
		instance_destroy()
	}
}

beginStep = function() {

}