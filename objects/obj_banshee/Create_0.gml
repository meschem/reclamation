/// @description Init

event_inherited();

name = "Banshee"

xp = baddie_xp_brutal
hpMax = 120
hp = hpMax
hpBarDisplay = baddieHpBarTypes.small

moveAccel = baddie_move_accel_med
moveSpeedMax = baddie_move_speed_ultra_fast

shadowSprite = spr_shadow_xl

floatRange = 2

moveRotationRate = 1
flies = true
phases = true

rotationBehavior = enemyRotateBehavior.flipTowardsPlayer

add_baddie_gold_brutal
