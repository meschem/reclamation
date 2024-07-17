/// @description Init

event_inherited();

apply_base_tier_stats(baddieTiers.large)

xp = 200
hpMax = 60
hp = hpMax

deathParticles = [
	obj_ptb_skel_bone_red,
	obj_ptb_skel_bone_red,
	obj_ptb_skel_bone_red,
	obj_ptb_skel_bone_red,
	obj_ptb_skel_ribs_red,
	obj_ptb_skel_skull_red,
]

hpBarDisplay = baddieHpBarTypes.small
walkAnimType = baddieWalkAnimTypes.curves
shadowSprite = spr_shadow_xl
shadowOffset = -3

add_baddie_gold_brutal

move_wander_setup()

baddie_teleport_enable(seconds_to_frames(6))

fireCdMax = 320
fireCdCur = fireCdMax
fireCount = 4
fireObject = obj_enemy_red_shot
fireAngleOffset = 0