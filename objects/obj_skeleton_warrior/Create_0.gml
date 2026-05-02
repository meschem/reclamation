/// @description Init

event_inherited();

name = "Skeleton Warrior"

shadowSprite = spr_shadow_lg
shadowOffset = -3

moveSpeedMax = baddie_move_speed_medium

walkAnimType = entityWalkAnimTypes.curves

xp = baddie_xp_tough
hpMax = baddie_hp_medium * 1.5
hp = hpMax
weight = baddie_weight_med
//hpBarDisplay = entityHpBarTypes.small

deathParticles = [
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_ribs_purp,
	obj_ptb_skel_skull_purp,
	obj_ptb_skel_shield,
	//obj_ptb_skel_sword,
]

onDestroy = function() {
    audio_play_sound(snd_bone_rattle, 1, false, 0.5, 0, random_range(0.9, 1.1))
    audio_play_sound(snd_wood_smash, 1, false, 0.7, 0, random_range(0.9, 1.1))
}

add_baddie_gold_tough
