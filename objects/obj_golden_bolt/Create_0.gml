/// @description Init

event_inherited()

name = "Coin"

distanceMax = 1500

damageDirect = 10

trail = true
trailColor = get_color(colors.yellow)

seeking = true
maxTurnRate = 0.6
maxTurnRateGain = 0.2
seekDistanceMax = -1
seekTarget = noone
onlyHitsSeekTarget = true
reseekBehavior = reseekBehaviors.acquireNearest

shadowSprite = spr_shadow_sm
