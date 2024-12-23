/// @description Init

event_inherited();

name = "Abaddon"

shadowSprite = spr_shadow_lg
shadowOffset = -3

moveSpeedMax = baddie_move_speed_medium

walkAnimType = entityWalkAnimTypes.curves

xp = baddie_xp_elite
hpMax = 50
hp = hpMax
weight = baddie_weight_med
hpBarDisplay = entityHpBarTypes.small

deathParticles = [
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_ribs_blue,
	obj_ptb_skel_skull_blue,
	//obj_ptb_skel_shield,
	//obj_ptb_skel_sword,
]

outlineColor = get_color(colors.red)

add_baddie_gold_brutal_plus

add_loot(obj_ore)

