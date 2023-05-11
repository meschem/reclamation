/// @description Init

angleSpriteToVelocity = false

lifeSpan = -1
age = 0

distanceMax = 120
distanceTraveled = 0
distancePerFrame = 1

xVel = 0
yVel = 0

knockback = 0

checkOnStrikeAbilities = false

damageDirect = 1
targetsMax = 1
targetsHit = 0

damageFrameCooldown = 60 // not used yet...

shadowSprite = spr_war_hammer_shadow

soundOnHit = snd_clack

critChance = 0.1
critMultiplier = 2

hitList = []

onCollideFx = function()
{
	spawn_fx_small_burst(x, y)
}
