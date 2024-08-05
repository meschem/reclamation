
event_inherited();

name = "Slime"

hpMax = 20
hp = hpMax
hpBarDisplay = baddieHpBarTypes.none

weight = baddie_weight_med
moveAccel = baddie_move_accel_slow
moveSpeedMax = baddie_move_speed_slow

shadowSprite = spr_shadow_lg
shadowOffset = -4

deathParticles = [
	obj_ptb_glob_grn_lg,
	obj_ptb_glob_grn_md,
	obj_ptb_glob_grn_sm,
	obj_ptb_glob_grn_sm,
	obj_ptb_glob_grn_sm,
]

onDestroy = function() {
	var inst, i
	
	for (i = 0; i < 2; i ++) {
		inst = spawn_baddie_at_location(obj_slime_green_small, x + 5, y + 5)
		inst.parentBaddie = id		
	}
}
