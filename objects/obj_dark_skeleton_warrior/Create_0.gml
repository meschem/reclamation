/// @description Init

event_inherited()

name = "Dark Skeleton Warrior"

xp = 150
hpMax = 150
hp = hpMax
weight = baddie_weight_med

walkAnimType = entityWalkAnimTypes.curves

add_loot_gold(10, 15)

deathParticles = [
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_ribs_blue,
	obj_ptb_skel_skull_blue,
]