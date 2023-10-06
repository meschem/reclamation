function activate_storm_aura() {
	//var inst = instance_create_depth(obj_player.x, obj_player.y, depths.fx, obj_particle)
	
	curCd = maxCd
	
	var actualRadius = runes[enumRunes.voldan].enabled ? (radius / 2) : radius
	var actualDamage = runes[enumRunes.voldan].enabled ? (damage * 3) : damage
	
	var inst = create_fx_fading_circle(obj_player.x, obj_player.y, actualRadius)
	
	inst.alphaStart = 0.1

	var target
	var killed
	var enemies = ds_list_create()	
	var count = collision_circle_list(
		obj_player.x,
		obj_player.y,
		actualRadius,
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

			if (obj_ability_storm_aura.runes[enumRunes.magdela].enabled)
				target.debuffShockAmount += 120
		
			killed = damage_baddie(target, actualDamage)			
		}
	}

	ds_list_destroy(enemies)
}