/// @description Init

event_inherited()

name = "Gilded Skeleton Warrior"

xp = 350
hpMax = 450
hp = hpMax
hpBarDisplay = entityHpBarTypes.small

walkAnimType = entityWalkAnimTypes.curves

weight = baddie_weight_heavy

deathParticles = [
	obj_ptb_skel_bone_yel,
	obj_ptb_skel_bone_yel,
	obj_ptb_skel_bone_yel,
	obj_ptb_skel_bone_yel,
	obj_ptb_skel_ribs_yel,
	obj_ptb_skel_skull_yel,
]

onDestroy = function() {
    audio_play_sound(snd_bone_rattle, 1, false, 0.5, 0, random_range(0.9, 1.1))
    audio_play_sound(snd_wood_smash, 1, false, 0.7, 0, random_range(0.9, 1.1))
}

add_loot_gold(60, 80)
