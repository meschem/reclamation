/// @description Init

enum projMovementTypes {
	velocity,
	explicit,
}

angleSpriteToVelocity = false

lifeSpan = -1
age = 0

distanceMax = 120
distanceTraveled = 0
distancePerFrame = 1

movementType = projMovementTypes.velocity
attachedTo = noone
xVel = 0
yVel = 0

knockback = 0

checkOnStrikeAbilities = false

damageDirect = 1
targetsMax = 1
targetsHit = 0

damageFrameCooldown = 60 // frames before the same target can be hit again

shadowSprite = spr_war_hammer_shadow

soundOnHit = snd_clack

critChance = 0.1
critMultiplier = 2

hitList = []

calcVelocity = function() {
	// Explicitly calc xVel and yVel
}

spawnPeriodicFx = function() {
	// override to spawn fx as needed
}

onCollideFx = function()
{
	spawn_fx_small_burst(x, y)
}
