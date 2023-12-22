/// @description Init

enum projMovementTypes {
	velocity,
	explicit,
}

enum targetTypes {
	none,
	baddie,
	terrain,
	length
}

enum projectileTypes {
	unset,
	weapon,
	ability,
}

projectileType = projectileTypes.unset

angleSpriteToVelocity = false
facingAngle = 0

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
moveSpeedMax = 100

rotationSpeed = 0 // rotation per frame

knockback = 0

checkOnStrikeAbilities = false

damageDirect = 1
targetsMax = 1
targetsHit = 0
canHitMultipleTargets = true // true if projectile can hit multiple targets per frame
targetCollisionList = ds_list_create() // used per frame
damageLostPerTarget = 0

applyShock = 0

damageFrameCooldown = 60 // frames before the same target can be hit again

shadowSprite = spr_war_hammer_shadow

soundOnHit = snd_clack

critChance = 0.1
critMultiplier = 2

hitList = []

seeking = false
maxTurnRate = -1
seekDistanceMax = -1
seekTarget = noone
onlyHitsSeekTarget = false

hitsWalls = true

lifeCycleEvents = []

setup_lifecycle_events()

weaponRef = noone // reference to obj_weapon that points to this object

enum reseekBehaviors {
	destroySelf,
	deactivateSeek
}

reseekBehavior = reseekBehaviors.deactivateSeek

///@description					Sets object to facing angle with the same velocity
///@param {real} angle
setAngle = function(angle) {
	var mag = point_distance(0, 0, xVel, yVel)
	
	xVel = angle_xvel(angle)
	yVel = angle_yvel(angle)
}

calcVelocity = function() {
	// Explicitly calc xVel and yVel
}

spawnPeriodicFx = function() {
	// override to spawn fx as needed
}

///@param {id.Instance} target		Target hit
onCollideFx = function(target = noone)
{
	spawn_fx_small_burst(x, y)
}

onDeathFx = function () {

}
