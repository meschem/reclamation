/// @description Init

enum enemyMoveBehaviors {
	none,
	charge
}

enum deathFxTypes {
	nothing,
	bones
}

enum enemyRotateBehavior {
	none,
	flipTowardsPlayer,
	rotateTowardsPlayer
}

enum enemyStates {
	normal,
	pushed,
	stunned,
}

deathFx = deathFxTypes.bones

moveBehavior = enemyMoveBehaviors.charge

moveSpeedMax = 0.5
moveSpeed = 0
moveRotationRate = -1 // -1 is "infinite"
moveAccel = 0.2

pushDeaccel = 0.075

state = enemyStates.normal

target = obj_player

flies = false
phases = false

frameAccel = moveAccel
frameMoveSpeedMax = moveSpeedMax

floatOffset = 0
floatRange = 0

xVel = 0
yVel = 0

xScale = 1
yScale = 1

rotation = 1

age = 0
hpMax = 100
hp = hpMax

damagedOn = -10
//damagedBy = []

weight = 3

soundOnDeath = snd_hard_hit // -1 is no sound

xp = 25

damageOnHit = 10

shadowSprite = -1 // -1 is no sprite
shadowOffset = 3 // vertical offset

pushRadius = 6

stunLength = 0

knockbackSlowRatio = 1
knockbackSlowDuration = 0
knockbackSlowHitFrame = 0
knockbackMaxSpeedRatio = 0.25

rotationBehavior = enemyRotateBehavior.none
