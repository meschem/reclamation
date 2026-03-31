/// @description Init

event_inherited();

name = "Skeleton"

hpMax = 20
hp = hpMax

pushForce = 6
pushRadius = 20

shadowSprite = spr_shadow_med
shadowOffset = -1

hpBarDisplay = entityHpBarTypes.none

walkAnimType = entityWalkAnimTypes.curves

impactMaterial = enumImpactMaterials.bone

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

image_index = floor(random(sprite_get_number(sprite_index)))

add_baddie_gold_fodder

