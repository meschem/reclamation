/// @description Init

event_inherited();

name = "Hydra Head"

xp = 0
hpMax = 1000
hp = hpMax
//hpBarDisplay = entityHpBarTypes.small

pushRadius = 11
pushForce = 10

moveAccel = baddie_move_accel_slow
moveSpeedMax = baddie_move_speed_very_fast
collidesWith = baddie_collision_flier

rotationBehavior = entityRotateBehavior.flipTowardsTarget

weight = 0

shadowSprite = spr_shadow_lg

floatRange = 2

moveRotationRate = 0.005 // not used
flies = true

