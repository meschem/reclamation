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

moveBehavior = enemyMoveBehaviors.charge

facingAngle = 0

targetType = targetTypes.baddie

parentBaddie = noone

damageReactionLength = 16
damageReactionCurve = animcurve_get(ac_baddie_hit_reaction)
damageReactionCurveXScale = animcurve_get_channel(damageReactionCurve, 0)
damageReactionCurveYScale = animcurve_get_channel(damageReactionCurve, 1)
damageXScaleMultiplier = 1
damageYScaleMultiplier = 1

moveSpeedMax = 0.35
moveSpeed = 0
moveRotationRate = -1 // -1 is "infinite"
moveAccel = 0.1

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

hitWall = false

xScale = 1
yScale = 1

rotation = 1

age = 0
lifeSpan = -1

hpMax = 100
hp = hpMax
hpBarDisplay = baddieHpBarTypes.small
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

debuffShockAmount = 0

xp = 25

damageOnHit = 10

shadowSprite = -1 // -1 is no sprite
shadowOffset = 3 // vertical offset

pushRadius = 6

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

markedForCrit = false // Guarantees crit, removed when activated

baddie_teleport_init()

outline_init()

loot = []

beginStep = function() {}
endStep = function() {}
onDestroy = function() {}
deathFx = function() {}
