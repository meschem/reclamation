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

onDestroy = function() {
    audio_play_sound(snd_bone_rattle, 1, false, 0.5, 0, random_range(0.9, 1.1))
    audio_play_sound(snd_wood_smash, 1, false, 0.7, 0, random_range(0.9, 1.1))
    create_hit_stun(2)
}

add_baddie_gold_brutal
