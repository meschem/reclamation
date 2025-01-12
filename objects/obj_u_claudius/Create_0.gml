/// @description Init

event_inherited();

name = "Cladius"

shadowSprite = spr_shadow_lg
shadowOffset = -3

moveSpeedMax = baddie_move_speed_medium

pushForce = baddie_push_force_massive
pushRadius = baddie_push_radius_medium

walkAnimType = entityWalkAnimTypes.curves

xp = 1000
hpMax = 1000
hp = hpMax
weight = baddie_weight_massive
hpBarDisplay = entityHpBarTypes.small

deathParticles = [
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_ribs_purp,
	obj_ptb_skel_skull_purp,
	obj_ptb_skel_shield,
	obj_ptb_skel_sword,
]

outlineColor = get_color(colors.red)

onDestroy = function() {
	var _inst = setup_spawner_endless(obj_dark_skeleton_warrior, 0, 1, 8)
	
	_inst.debug = true
}
