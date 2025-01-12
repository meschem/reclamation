/// @description Init

event_inherited();

name = "Skeleton Champion"

walkAnimType = entityWalkAnimTypes.curves

moveSpeedMax = baddie_move_speed_slow
xp = baddie_xp_brutal
pushRadius = baddie_push_radius_large

hpMax = baddie_hp_very_high
hp = hpMax

shadowSprite = spr_shadow_xxl
shadowOffset = -9

image_index = floor(random(sprite_get_number(sprite_index)))

deathParticles = [
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_ribs_purp,
	obj_ptb_skel_skull_purp,
]

add_baddie_gold_brutal
