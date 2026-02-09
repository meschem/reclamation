/// @description Init

event_inherited()

name = "Coin"

distanceMax = 1500

damageDirect = 10

trail = true
trailColor = get_color(colors.yellow)

seekStyle = projectileSeekStyles.sharp
seeking = true
seekAccel = 0.3
seekTarget = noone
seekDistanceMax = -1

maxTurnRate = 0.6
maxTurnRateGain = 0.2

moveSpeedMax = 5

onlyHitsSeekTarget = true
reseekBehavior = reseekBehaviors.acquireNearest

shadowSprite = spr_shadow_sm

onStep = function() {
	seekAccel += 0.035
}