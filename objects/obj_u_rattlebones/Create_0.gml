/// @description Init

event_inherited();

name = "Rattlebones"

shadowSprite = spr_shadow_lg
shadowOffset = -3

moveSpeedMax = baddie_move_speed_fast

walkAnimType = entityWalkAnimTypes.curves

pushForce = baddie_push_force_heavy

xp = baddie_xp_elite
hpMax = 500
hp = hpMax
weight = baddie_weight_med
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

add_baddie_gold_brutal_plus

dropType = enumDropType.baddieUnique

onDestroy = function() {
	
	with (obj_run_controller) {
		enemyScalingHp += 0.15
	}
	
	create_toaster("ENEMY HEALTH SCALING +15%")
}
