/// @description Init

event_inherited()

name = "Burning Dead"

hpMax = 20
hp = hpMax

deathParticles = [
	obj_ptb_skel_bone_red,
	obj_ptb_skel_bone_red,
	obj_ptb_skel_bone_red,
	obj_ptb_skel_bone_red,
	obj_ptb_skel_ribs_red,
	obj_ptb_skel_skull_red,
]

shadowSprite = spr_shadow_med
shadowOffset = -1

walkAnimType = entityWalkAnimTypes.curves

add_baddie_gold_fodder
