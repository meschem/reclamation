/// @description Init

event_inherited();

name = "Burning Dead Champion"

walkAnimType = entityWalkAnimTypes.curves

moveSpeedMax = baddie_move_speed_slow
xp = baddie_xp_brutal
pushRadius = baddie_push_radius_large
weight = baddie_weight_heavy

hpMax = baddie_hp_very_high
hp = hpMax

shadowSprite = spr_shadow_xxl
shadowOffset = -9

image_index = floor(random(sprite_get_number(sprite_index)))

deathParticles = [
	obj_ptb_skel_bone_red,
    obj_ptb_skel_bone_red,
    obj_ptb_skel_bone_red,
    obj_ptb_skel_bone_red,
    obj_ptb_skel_bone_red,
    obj_ptb_skel_bone_red,
    obj_ptb_skel_bone_red,
    obj_ptb_skel_bone_red,
    obj_ptb_skel_bone_red,
	obj_ptb_skel_skull_red,
]

add_baddie_gold_brutal
