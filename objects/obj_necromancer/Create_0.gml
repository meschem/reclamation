/// @description Init

event_inherited()

name = "Necromancer"

apply_base_tier_stats(baddieTiers.large)

xp = 200
hpMax = 80
hp = hpMax

deathParticles = [
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_ribs_blue,
	obj_ptb_skel_skull_blue,
]

hpBarDisplay = baddieHpBarTypes.small
walkAnimType = baddieWalkAnimTypes.curves
shadowSprite = spr_shadow_xl
shadowOffset = -3

add_baddie_gold_brutal

move_wander_setup()

baddie_teleport_enable(600)

summonCdMin = 800
summonCdMax = 1200
summonCdCur = summonCdMax
summonCount = 6
summonType = obj_skeleton_summoned
