/// @description Init

event_inherited();

name = "Cursed Skeleton"

hpMax = 250
hp = hpMax

pushForce = 6
pushRadius = 15

damageOnHit = 20

moveSpeedMax = baddie_move_speed_fast

shadowSprite = spr_shadow_med
shadowOffset = -1

hpBarDisplay = entityHpBarTypes.none

walkAnimType = entityWalkAnimTypes.curves

deathParticles = [
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_ribs_purp,
	obj_ptb_skel_skull_purp,
]

image_index = floor(random(sprite_get_number(sprite_index)))
