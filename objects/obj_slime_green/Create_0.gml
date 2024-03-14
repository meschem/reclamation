
event_inherited();

hpMax = 60
hp = hpMax

weight = baddie_weight_none
moveAccel = baddie_move_accel_slow

shadowSprite = spr_shadow_lg
shadowOffset = -4

onDestroy = function() {
	var inst, i
	
	for (i = 0; i < 1; i ++) {
		inst = spawn_baddie_at_location(obj_slime_green_small, x + 5, y + 5)
		inst.parentBaddie = id		
	}
}

deathFx = function() {
	var mag, angle, velocity, particle, rnd
	var baseAngleOffset = irandom(90)

	for (var i = 0; i < 8; i++) {
		particle = instance_create_depth(x, y, depths.enemy, obj_particle_slime_bit)
		rnd = random(1)
		
		if (rnd > 0.7) {
			particle.sprite_index = spr_slime_bit_green_lg
			mag = random(0.4) + 0.25
		} else if (random > 0.6) {
			particle.sprite_index = spr_slime_bit_green_md
			mag = random(1.25) + 0.5
		} else {
			mag = random(2.5) + 0.8
		}

		angle = irandom(60) + (i * 90) + baseAngleOffset
		velocity = get_velocity_from_angle(angle, mag)
		
		particle.xVel = velocity[0]
		particle.yVel = velocity[1]
		particle.zVel = random(3) -4
	}
}
