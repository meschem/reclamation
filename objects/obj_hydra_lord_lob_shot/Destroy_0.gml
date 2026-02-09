
//instance_create_depth(x, y, depths.enemyProjectile, obj_fire_pit)

var _inst = instance_create_depth(x, y, depths.fx, obj_particle_single_cycle)

_inst.sprite_index = spr_orange_explosion

audio_play_sound(snd_fireball_impact_short, 2, false, 0.4)

for (var i = 0; i < 3; i++) {
	launch_projectile_from_point(
		obj_enemy_red_shot,
		explodeProjectileAngleOffset + i * 120,
		1,
		x,
		y
	)
}
