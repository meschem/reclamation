
event_inherited();

name = "Slime"

hpMax = 30
hp = hpMax
hpBarDisplay = entityHpBarTypes.none

weight = baddie_weight_med
moveAccel = baddie_move_accel_slow
moveSpeedMax = baddie_move_speed_slow

shadowSprite = spr_shadow_lg
shadowOffset = -4

image_index = irandom(sprite_get_number(spr_slime_blue))

deathParticles = [
	obj_ptb_glob_blue_lg,
	obj_ptb_glob_blue_md,
	obj_ptb_glob_blue_sm,
	obj_ptb_glob_blue_sm,
	obj_ptb_glob_blue_sm,
]

onDestroy = function() {
	var inst, i
	
	for (i = 0; i < 2; i ++) {
		inst = spawn_baddie_at_location(obj_slime_blue_small, x + 5, y + 5)
		inst.parentBaddie = id		
	}
}
