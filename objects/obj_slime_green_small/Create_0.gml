
event_inherited();

hpMax = 50
hp = hpMax

weight = baddie_weight_none

shadowSprite = spr_shadow_lg
shadowOffset = -3

deathFx = function() {
	var mag, angle, velocity, particle, rnd
	var baseAngleOffset = irandom(90)

	for (var i = 0; i < 4; i++) {
		particle = instance_create_depth(x, y, depths.enemy, obj_particle_slime_bit)
		rnd = random(1)
		
		 if (random > 0.66) {
			particle.sprite_index = spr_slime_bit_green_md
			mag = random(1) + 0.4
		} else {
			mag = random(2) + 0.75
		}

		angle = irandom(60) + (i * 90) + baseAngleOffset
		velocity = get_velocity_from_angle(angle, mag)
		
		particle.xVel = velocity[0]
		particle.yVel = velocity[1]
		particle.zVel = random(3) -4
	}
}