/// @description  Damages and pushes back units in an AOE
/// @param {real} level

function activate_war_stomp(level) {
	var target, inst, pushAngle
	var enemies = ds_list_create()

	var radius = 128
	var pushDistance = 10
	var stunLength = 2
	var amount = 20

	var count = collision_circle_list(
		x,
		y,
		radius,
		obj_baddie,
		false,
		true,
		enemies,
		false
	);
	
	var fxCircle = spawn_fx_circle(128)

	if (count > 0) {
		for (var i = 0; i < count; i++)
		{
		    target = enemies[| i]			
			pushAngle = point_direction(x, y, target.x, target.y)
			
			knockback_baddie(target, 10, pushAngle)
			stun_baddie(target, 2)
			
			inst = instance_create_depth(target.x, target.y, depths.fx, obj_particle_single_cycle)
			inst.sprite_index = spr_particle_lightning_medium

			damage_baddie(target, amount)
		}
	}

	ds_list_destroy(enemies)
}