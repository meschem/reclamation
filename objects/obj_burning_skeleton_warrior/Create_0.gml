/// @description Init

event_inherited();

name = "Burning Dead Warrior"

shadowSprite = spr_shadow_lg
shadowOffset = -3

moveSpeedMax = baddie_move_speed_medium

walkAnimType = entityWalkAnimTypes.curves

xp = baddie_xp_tough
hpMax = baddie_hp_high
hp = hpMax
weight = baddie_weight_med
//hpBarDisplay = entityHpBarTypes.small

deathParticles = [
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_ribs_purp,
	obj_ptb_skel_skull_purp,
	obj_ptb_skel_shield,
]

add_baddie_gold_tough
