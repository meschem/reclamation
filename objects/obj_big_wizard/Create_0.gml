/// @description Init

event_inherited();

name = "Banshee"

xp = baddie_xp_brutal
hpMax = 120
hp = hpMax

moveAccel = baddie_move_accel_med
moveSpeedMax = baddie_move_speed_very_fast
pushRadius = baddie_push_radius_large
pushForce = baddie_push_force_heavy

shadowSprite = spr_shadow_xl

floatRange = 2

moveRotationRate = 1
flies = true
phases = true

rotationBehavior = entityRotateBehavior.flipTowardsTarget

add_baddie_gold_brutal
