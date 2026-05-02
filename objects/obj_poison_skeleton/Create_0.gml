/// @description Init

event_inherited()

name = "Toxic Dead"

hpMax = 25
hp = hpMax

shadowSprite = spr_shadow_med
shadowOffset = -1

deathParticles = [
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_ribs_purp,
	obj_ptb_skel_skull_purp,
]

onDestroy = function() {
	instance_create_depth(x, y, depths.enemyFloorFx, obj_poison_pit)
    audio_play_sound(snd_bone_rattle, 1, false, 0.5, 0, random_range(0.9, 1.1))
    audio_play_sound(snd_wood_smash, 1, false, 0.7, 0, random_range(0.9, 1.1))
}

add_baddie_gold_fodder
