/// @description Init

event_inherited()

name = "Summoned Skeleton"

deathParticles = [
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_ribs_blue,
	obj_ptb_skel_skull_blue,
]

xp = 0
hpMax = 20
hp = hpMax
lifeSpan = seconds_to_frames(random_range(9, 12))

walkAnimType = entityWalkAnimTypes.curves

shadowSprite = spr_shadow_med
shadowOffset = -1
