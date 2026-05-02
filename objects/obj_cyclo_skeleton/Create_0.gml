/// @description Init

event_inherited()

name = "Cycloskeleton"

hpMax = 40
hp = hpMax

pushForce = 6
pushRadius = 20

shadowSprite = spr_shadow_med
shadowOffset = -1

walkAnimType = entityWalkAnimTypes.curves

impactMaterial = enumImpactMaterials.bone

deathParticles = [
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_ribs_blue,
	obj_ptb_skel_skull_blue,
]

onDestroy = function() {
    audio_play_sound(snd_bone_rattle, 1, false, 0.5, 0, random_range(0.9, 1.1))
    audio_play_sound(snd_wood_smash, 1, false, 0.7, 0, random_range(0.9, 1.1))
}

add_baddie_gold_fodder