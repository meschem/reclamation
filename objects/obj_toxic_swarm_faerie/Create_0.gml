// Inherit the parent event
event_inherited()

name = "Toxic Faerie"

distanceMax = 1500

damageDirect = 10

trail = true
trailColor = get_color(colors.green)

poisons = true

seeking = true
seekDistanceMax = -1
seekTarget = noone
onlyHitsSeekTarget = false
reseekBehavior = reseekBehaviors.destroySelf
seekStyle = projectileSeekStyles.sharp
moveSpeedMax = 10

shadowSprite = spr_shadow_sm
targetsMax = -1

xVel = 5
yVel = 5
distanceMax = -1

sleepDuration = stf(2)

onHit = function(target) {
	collisionDelay = stf(2)
}

stepEnd = function() {
	image_alpha = (collisionDelay <= 0) ? 1 : 0.25
}
