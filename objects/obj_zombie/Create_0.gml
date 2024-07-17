/// @description Init

event_inherited();

name = "Zombie"

walkAnimType = baddieWalkAnimTypes.curves

moveSpeedMax = baddie_move_speed_slow
xp = baddie_xp_fodder

hpMax = 60
hp = hpMax

shadowSprite = spr_shadow_med
shadowOffset = -1

add_loot_gold(4, 6)

deathParticles = [
	obj_ptb_zombie_head_grn,
	obj_ptb_zombie_torso_grn,
	obj_ptb_zombie_limb_grn,
	obj_ptb_zombie_limb_grn,
	obj_ptb_zombie_limb_grn,
	obj_ptb_zombie_limb_grn,
]

add_baddie_gold_fodder
