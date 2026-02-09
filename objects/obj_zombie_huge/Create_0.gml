/// @description Init

event_inherited();

name = "Giant Zombie"

walkAnimType = entityWalkAnimTypes.curves

moveSpeedMax = baddie_move_speed_slow
xp = baddie_xp_brutal

hpMax = baddie_hp_massive
hp = hpMax

impactMaterial = enumImpactMaterials.flesh

weight = baddie_weight_heavy

pushRadius = baddie_push_radius_large

shadowSprite = spr_shadow_xxl
shadowOffset = -6

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
