///@description			Parent for all entities

name = "Unnamed"
description = ""

walkAge = 0
walkAnimType = entityWalkAnimTypes.sprite
walkAnimHeight = 3
walkAnimRotation = 6
walkCurveCycleLength = seconds_to_frames(1)

collisionType = entityCollisionTypes.none

teleportEnabled = false
teleportCdCur = 0
teleportCdMin = stf(4)
teleportCdMax = stf(8)

facingAngle = 0

hasLimbs = false
limbs = {}

moveSpeedMax = 0.5
moveSpeed = 0
moveRotationRate = -1 // -1 is "infinite"
moveAccel = 0.1

target = noone

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
rotation = 0

age = 0
lifeSpan = -1

hpMax = 100
hp = hpMax
diesAtZeroHp = true

hpBarDisplay = entityHpBarTypes.none
hpBarInst = noone
hpBarInfo = {
	setup: false,
	yPos: 0,
	xPos: 0,
	width: 0,
	yOffset: -5,
	bgColor: get_color(colors.dark_purple),
	fillColor: get_color(colors.red)
}


lastDamageAngle = 0
lastDamageForce = 1
damagedOn = -999
damagedFlashDuration = 6
killedByBounds = false
rotationBehavior = entityRotateBehavior.none

weight = 3

knockbackSlowRatio = 1
knockbackSlowDuration = 0
knockbackSlowHitFrame = 0
knockbackMaxSpeedRatio = 0.25

soundOnDeath = snd_wood_roll
deathParticleSpawnRange = new vec2(0, 0)
deathParticles = []
spawnedBy = noone

rotationBehavior = entityRotateBehavior.none
shadowSprite = -1 // -1 is no sprite
shadowOffset = 3 // vertical offset
feetOffset = 14 // offset from sprite center to mark foot for depth adjustments

collidesWith = baddie_collision_walker
pushRadius = 14
pushForce = 5
pushWeightScalar = 1
immovable = false
poisonImmune = false

outlineColor = c_black
stunLength = -1
markedForCrit = false

damageReactionLength = 16
damageReactionCurve = animcurve_get(ac_baddie_hit_reaction)
damageReactionCurveXScale = animcurve_get_channel(damageReactionCurve, 0)
damageReactionCurveYScale = animcurve_get_channel(damageReactionCurve, 1)
damageXScaleMultiplier = 1
damageYScaleMultiplier = 1
damageReactionScaleScalar = 1

onDestroyList = []	// List of functions executed on death

beginStep = function() {}
endStep = function() {}
onDestroy = function() {}
onDamaged = function() {}

deathFx = function() {
	if (global.createDeathParticles) {
		spawn_fx_bouncers(deathParticles, lastDamageAngle, lastDamageForce)
	}
}

