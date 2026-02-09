/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

name = "Boarrior"

hpMax = baddie_hp_very_high
xp = baddie_xp_tough
hp = hpMax

setup_move_charge_to_stop(1.25, 25)

moveAccel = 0.3
moveDeaccel = 0.3
moveSpeedMax = 2

pushForce = baddie_push_force_massive
pushRadius = baddie_push_radius_medium
pushWeightScalar = 0.5

shadowSprite = spr_shadow_lg
shadowOffset = 0

walkAnimType = entityWalkAnimTypes.curves
