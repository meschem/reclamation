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

add_baddie_gold_fodder