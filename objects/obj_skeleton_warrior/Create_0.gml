/// @description Init

event_inherited();

name = "Skeleton Warrior"

shadowSprite = spr_shadow_lg
shadowOffset = -3

moveSpeedMax = baddie_move_speed_medium

walkAnimType = baddieWalkAnimTypes.curves

xp = baddie_xp_tough
hpMax = 120
hp = hpMax
weight = baddie_weight_med
hpBarDisplay = baddieHpBarTypes.small

deathParticles = [
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_ribs_purp,
	obj_ptb_skel_skull_purp,
	obj_ptb_skel_shield,
	//obj_ptb_skel_sword,
]

add_baddie_gold_tough
