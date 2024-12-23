/// @description Init

event_inherited()

angleSpriteToVelocity = true

distanceMax = 150

damageDirect = 20
targetsMax = 1
targetsHit = 0

bonusDamageOnBounce = 0

solidCollisionBehavior = projSolidCollisionBehaviors.bounce
bouncesMax = 0
bouncesCur = 0

// damageFrameCooldown = 60 // not used yet...

knockback = 0

shadowSprite = spr_dagger_shadow

trailColor = get_color(colors.orange)
trailSpawnWidth = 3
trailLength = 8
trail = true

onBounce = function() {
	damageDirect += bonusDamageOnBounce
}