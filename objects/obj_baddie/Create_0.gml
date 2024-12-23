/// @description Init

enum entityMoveBehaviors {
	none,
	simple,
	charge,
	wander,
	fourDir,
	chargeToStop,
	custom,
}

enum deathFxTypes {
	nothing,
	bones
}

enum entityRotateBehavior {
	none,
	flipTowardsTarget,
	rotateTowardsTarget,
}

enum enemyStates {
	normal,
	pushed,
	stunned,
	abilityRage,
}

enum enemyMoveStates {
	moving,
	slowing,
	stopped,
}

enum entityHpBarTypes {
	none,
	small,
	bigCenter,
	boss,
}

enum entityWalkAnimTypes {
	sprite,		// frame-based, driven by sprite
	curves		// uses curves to hop and angle
}

enum entityCollisionTypes {
	none,
	baddie,
	playerSummon,
}

event_inherited()

moveBehavior = entityMoveBehaviors.charge
collisionType = entityCollisionTypes.baddie

damageOnCollide = true

targetType = targetTypes.baddie

parentBaddie = noone

damageReactionLength = 16
damageReactionCurve = animcurve_get(ac_baddie_hit_reaction)
damageReactionCurveXScale = animcurve_get_channel(damageReactionCurve, 0)
damageReactionCurveYScale = animcurve_get_channel(damageReactionCurve, 1)
damageXScaleMultiplier = 1
damageYScaleMultiplier = 1

moveSpeedMax = baddie_move_speed_medium
moveDeaccel = 1
moveState = enemyMoveStates.moving

minionType = object_index
minionCount = 12

spawnSide = "unset"

pushDeaccel = 0.075

state = enemyStates.normal

target = get_player_target()

debuffShockAmount = 0

xp = 25
ultimateCharge = 25

damageOnHit = 10

// START BUFFS

stunLength = 0
shockedLength = 0

slowLength = 0
slowMoveScalar = 0.5

poisonStacks = 0
poisonDamageCdMax = seconds_to_frames(1)
poisonDamageCdCur = poisonDamageCdMax
poisonLength = 0
poisonInflictor = noone

// END BUFFS

bossScale = 2
isElite = false
isBoss = false
outlineColor = c_black

markedForCrit = false // Guarantees crit, removed when activated

baddie_teleport_init()

outline_init()

loot = []

