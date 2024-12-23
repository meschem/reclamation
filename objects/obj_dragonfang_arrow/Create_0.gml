/// @description Init

event_inherited()

angleSpriteToVelocity = true

damageScalarPerBounce = 1

trail = true
trailColor = get_color(colors.orange)
trailLength = 30
trailSpawnWidth = 8

solidCollisionBehavior = projSolidCollisionBehaviors.bounce
bouncesMax = 10
bouncesCur = 0

targetsMax = -1

knockback = 10

distanceMax = 3000

impactSoundsMax = 999
impactSounds = [snd_paper_slap] 
shadowSprite = spr_armor_spike_shadow

onBounce = function() {
	hitList = []
	damageDirect += (damageScalarPerBounce - 1) * baseDamage
}
