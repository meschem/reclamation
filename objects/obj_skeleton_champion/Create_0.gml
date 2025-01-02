/// @description Init

event_inherited();

name = "Skeleton Champion"

walkAnimType = entityWalkAnimTypes.curves

moveSpeedMax = baddie_move_speed_slow
xp = baddie_xp_brutal

hpMax = baddie_hp_very_high
hp = hpMax

shadowSprite = spr_shadow_xxl
shadowOffset = -9

image_index = floor(random(sprite_get_number(sprite_index)))

deathParticles = [
	obj_ptb_zombie_head_grn,
	obj_ptb_zombie_torso_grn,
	obj_ptb_zombie_torso_grn,
	obj_ptb_zombie_torso_grn,
	obj_ptb_zombie_limb_grn,
	obj_ptb_zombie_limb_grn,
	obj_ptb_zombie_limb_grn,
	obj_ptb_zombie_limb_grn,
]

add_baddie_gold_brutal
