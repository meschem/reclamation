 /// @description Init

enum projMovementTypes {
	velocity,
	explicit,
}

enum targetTypes {
	none,
	baddie,
	destructible,
	terrain,
	length
}

enum projectileTypes {
	unset,
	weapon,
	ability,
	enemy
}

enum reseekBehaviors {
	destroySelf,
	deactivateSeek,
	acquireNearest
}

enum projSolidCollisionBehaviors {
	none,
	bounce
}

enum enumDamageTypes {
	normal,
	piercing,
	heavy,
	fire,
	cold,
	lightning,
	poison
}

projectileType = projectileTypes.unset

angleSpriteToVelocity = false
facingAngle = 0

spawnDelay = 0
draw = true
lifeSpan = -1
age = 0

animSpeed = 1

distanceMax = 1200
distanceTraveled = 0
distancePerFrame = 1

movementType = projMovementTypes.velocity
attachedTo = noone
attachedOrigin = new vec2(0, 0)
attachedVelocity = new vec2(0, 0)
xVel = 0
yVel = 0
moveSpeedMax = -1
moveSpeedMin = 0

xAccel = 0
yAccel = 0
acceleration = 0

rotationSpeed = 0 // rotation per frame
rotationSpeedDeaccel = 0

knockback = 0

checkOnStrikeAbilities = false

damageDirect = 1
damageType = enumDamageTypes.normal
targetsMax = 1
targetsHit = 0
pierceChance = 0
canHitMultipleTargets = true // true if projectile can hit multiple targets per frame
targetCollisionList = ds_list_create() // used per frame
validTargetList = ds_list_create() // used per frame for targets that are valid to damage
damageLostPerTarget = 0

solidCollisionBehavior = projSolidCollisionBehaviors.none

applyShock = 0

damageFrameCooldown = 60 // frames before the same target can be hit again

shadowSprite = spr_war_hammer_shadow
shadowOffsetY = 5

soundOnHit = snd_thud_impact

critChance = 0
critMultiplier = 2

hitList = []

seeking = false
seekStyle = projectileSeekStyles.wide
seekDistanceMax = -1
seekTarget = noone
seekAccel = 0.5
onlyHitsSeekTarget = false

maxTurnRate = -1
maxTurnRateGain = 0

hitsWalls = true
collisionDelay = 0

trail = false
trailSpawnWidth = 5
trailLength = 10			//Count of segments. not pixels.
trailSegments = []
trailColor = c_white

previousFramePos = new vec2()

lifeCycleEvents = []

impactSounds = []			//List of sounds that are randomly played
impactSoundsLeft = 0
impactSoundsCount = 0
impactSoundsMax = 3
impactSoundsMaxPerFrame = 1
impactSoundFrameSkip = false

owner = noone

poisons = false
poisonStacksOnHit = 0
poisonDuration = seconds_to_frames(6)
bonusPoisonDamageScalar = 0

reflectOffsetY = 10

setup_lifecycle_events()

weaponRef = noone // reference to obj_weapon that points to this object

reseekBehavior = reseekBehaviors.deactivateSeek

run_wupg_lifecycle_events(enumLifeCycleEvents.create, {
	projectile: id
})

///@description				Builds trail components into trail[] array
buildTrail = function() {
	var _trailLengthCur = array_length(trailSegments)
	var _segment
	
	// Add new segment
	//_segment = new trailSegment(new vec2(x, y), previousFramePos)
	_segment = new trailSegment(new vec2(x, y), new vec2(previousFramePos.x, previousFramePos.y), 3, 3, trailColor)
	array_push(trailSegments, _segment)
	_trailLengthCur++
	
	// Cull if needed	
	if (_trailLengthCur > trailLength) {
		for (var i = 0; i < trailLength; i++) {
			trailSegments[i].startPos.x = trailSegments[i + 1].startPos.x
			trailSegments[i].startPos.y = trailSegments[i + 1].startPos.y
			
			trailSegments[i].endPos.x = trailSegments[i + 1].endPos.x
			trailSegments[i].endPos.y = trailSegments[i + 1].endPos.y
		}
		
		array_pop(trailSegments)
		_trailLengthCur--
	}
	
	var _curWidth = trailSpawnWidth
	var _decrement = trailSpawnWidth / _trailLengthCur

	for (var i = _trailLengthCur - 1; i >= 0; i--) {
		trailSegments[i].startWidth = _curWidth
		_curWidth -= _decrement
		trailSegments[i].endWidth = _curWidth
	}
}

///@description				Draws components from trail[] array
drawTrail = function() {
	for (var i = 0; i < array_length(trailSegments); i++ ) {
		trailSegments[i].draw()
	}
}

///@description					Sets object to facing angle with the same velocity
///@param {real} angle
setAngle = function(angle) {
	var mag = point_distance(0, 0, xVel, yVel)
	
	xVel = angle_xvel(angle)
	yVel = angle_yvel(angle)
}

// Lifecycle functions
onHit = function(target) {}
stepBegin = function() {}
stepEnd = function() {}

///@description					Applies FX or debuffs to enemy list that was hit
///								before damage is applied. Good place to mark for crit
///@param {id.DsList}			enemyList
preDamage = function(enemyList) {

}

calcVelocity = function() {
	// Explicitly calc xVel and yVel
}

spawnPeriodicFx = function() {
	// override to spawn fx as needed
}

///@description					Specific to colliding with solids and not entities
///								This does not activate if the solid collision behavior is none
onBounce = function() {

}

///@param {id.Instance} target		Target hit
onCollideFx = function(target = noone)
{
	spawn_fx_small_burst(x, y)
}

onDeathFx = function () {

}

queueImpactSound = function() {
	if (array_length(impactSounds) == 0) {
		return false
	}
	
	if (impactSoundsCount < impactSoundsMax) {
		impactSoundsCount++
	}
}

///@description						Calculates the base damage with any additives
///@return {real}					Returned damage to start calculating with
//getBaseDamage = function() {
//	var _damage = damageDirect
	
//	_damage += damageStatBoostStr * (owner.baseStr + owner.bonusStr)
//	_damage += damageStatBoostDex * (owner.baseDex + owner.bonusDex)
//	_damage += damageStatBoostInt * (owner.baseInt + owner.bonusInt)
	
//	return _damage
//}

///@description						Calculates scalars just prior to damage being applied.
///									Returns damage that should be dealt.
///@param {id.Instance} _target		Target instance
///@return {real}
getScaledDamage = function(_target) {
	var _scalar = 1
	var _baseDamage = damageDirect
	
	if (_target.poisonStacks > 0) {
		_scalar += bonusPoisonDamageScalar
	}
	
	return _baseDamage * _scalar
}
