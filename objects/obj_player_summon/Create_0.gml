enum playerSummonMovementTypes {
	idle,
	roamer,
	attacker,
}

event_inherited()

hpMax = 50
hp = hpMax

collisionType = entityCollisionTypes.playerSummon
moveBehavior = entityMoveBehaviors.simple

invulnFrames = 20
lastHitOn = -1

returnDamage = -1
returnKnockback = 10

teleportEnabled = false

age = 0
lifeSpan = -1

shadowSprite = spr_none
shadowOffset = 0

colliding = true
movementType = playerSummonMovementTypes.idle

xVel = 0
yVel = 0

moveSpeedMax = 4