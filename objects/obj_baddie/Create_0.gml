/// @description Init

enum enemyMoveBehaviors {
	none,
	simple,
	charge,
	wander,
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

enum baddieHpBarTypes {
	none,
	small,
	bigCenter,
	boss,
}

enum baddieWalkAnimTypes {
	sprite,		// frame-based, driven by sprite
	curves		// uses curves to hop and angle
}

name = "Unnamed"
description = ""

moveBehavior = enemyMoveBehaviors.charge

walkAge = 0
walkAnimType = baddieWalkAnimTypes.sprite
walkAnimHeight = 3
walkAnimRotation = 6

walkCurveCycleLength = seconds_to_frames(1)

facingAngle = 0

targetType = targetTypes.baddie

parentBaddie = noone

damageReactionLength = 16
damageReactionCurve = animcurve_get(ac_baddie_hit_reaction)
damageReactionCurveXScale = animcurve_get_channel(damageReactionCurve, 0)
damageReactionCurveYScale = animcurve_get_channel(damageReactionCurve, 1)
damageXScaleMultiplier = 1
damageYScaleMultiplier = 1

moveSpeedMax = baddie_move_speed_medium
moveSpeed = 0
moveRotationRate = -1 // -1 is "infinite"
moveAccel = 0.1

minionType = object_index
minionCount = 12

spawnSide = "unset"

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
lastX = 0
lastY = 0

hitWall = false

xScale = 1
yScale = 1

rotation = 1

age = 0
lifeSpan = -1

hpMax = 100
hp = hpMax

hpBarDisplay = baddieHpBarTypes.none
hpBarInst = noone
hpBarInfo = {
	setup: false,
	yPos: 0,
	xPos: 0,
	width: 0,
	yOffset: -5
}

damagedOn = -10

weight = 3

soundOnDeath = snd_wood_roll
collidesWith = baddie_collision_walker

debuffShockAmount = 0

xp = 25
ultimateCharge = 25

damageOnHit = 10

shadowSprite = -1 // -1 is no sprite
shadowOffset = 3 // vertical offset

pushRadius = 8
pushForce = 5

stunLength = 0
shockedLength = 0

knockbackSlowRatio = 1
knockbackSlowDuration = 0
knockbackSlowHitFrame = 0
knockbackMaxSpeedRatio = 0.25

rotationBehavior = enemyRotateBehavior.none

bossScale = 2
isElite = false
isBoss = false
outlineColor = c_black
killedByBounds = false

lastDamageAngle = 0
lastDamageForce = 1

deathParticleSpawnRange = new vec2(0, 0)
deathParticles = []

markedForCrit = false // Guarantees crit, removed when activated

baddie_teleport_init()

outline_init()

loot = []

onDestroyList = []	// List of functions executed on death

beginStep = function() {}
endStep = function() {}
onDestroy = function() {}

deathFx = function() {
	if (global.createDeathParticles) {
		spawn_fx_bouncers(deathParticles, lastDamageAngle, lastDamageForce)
	}
}
