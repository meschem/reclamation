function activate_storm_aura(level) {
	damage = level * 8
	radius = 80 + (level * 20)
	
	curCd = maxCd
	// damage = obj_game_controller.talents[talentList.stormAura][talentProps.curLevel] * 8
	
	var inst = instance_create_depth(obj_player.x, obj_player.y, depths.fx, obj_particle)
	
	inst.changeAlpha = true
	inst.alphaStart = 0.33
	inst.image_alpha = 0.33
	inst.sprite_index = spr_particle_solid_32_circle
	inst.image_xscale = (radius * 2) / 32
	inst.image_yscale = (radius * 2) / 32
	inst.lifeSpan = 28
	
	var target
	var killed
	var enemies = ds_list_create()	
	var count = collision_circle_list(
		obj_player.x,
		obj_player.y,
		radius,
		obj_baddie,
		false,
		true,
		enemies,
		false
	);

	if (count > 0) {
		for (var i = 0; i < count; i++)
		{
		    target = enemies[| i]
			
			inst = instance_create_depth(target.x, target.y, depths.fx, obj_particle_single_cycle)
			inst.sprite_index = spr_particle_lightning_medium
		
			killed = damage_baddie(target, damage)			
		}
	}

	ds_list_destroy(enemies)
}