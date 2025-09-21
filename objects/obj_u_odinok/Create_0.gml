/// @description Init

event_inherited();

name = "Odinok"

shadowSprite = spr_shadow_lg
shadowOffset = -3

moveSpeedMax = 1

pushForce = baddie_push_force_massive
pushRadius = baddie_push_radius_medium

walkAnimType = entityWalkAnimTypes.curves

xp = 1000
hpMax = 1000
hp = hpMax
weight = baddie_weight_light
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

add_loot(obj_merger_item_chest)

beginStep = function() {
	moveSpeedMax += 0.005
}

onDamaged = function() {
	moveSpeedMax = 1
}

onDestroy = function() {
	with (obj_run_controller) {
		enemyScalingMoveSpeed += 0.1
	}
	
	create_toaster("ENEMY SPEED INCREASED BY 10%")
}