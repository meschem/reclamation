/// @description Init

event_inherited();

name = "Skeleton"

hpMax = 40
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

image_index = floor(random(sprite_get_number(sprite_index)))

add_baddie_gold_fodder

