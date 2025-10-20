///@Description 

if (game_is_paused()) {
	return 0
}

age++

if (age < initialDelay) {
	return 0
}

tickCd--

if (tickCd <= 0) {
	var _radius = radius
	var _damage = damagePerTick
	var _curCrits = 0
	
	if (ticks == 1) {
		_radius = explosionRadius
		_damage = explosionDamage
	
		var _bolt = instance_create_depth(x, y, depths.ui, obj_particle_single_cycle)
		_bolt.sprite_index = spr_rune_lit_bolt
		_bolt.image_xscale = 1.5
		_bolt.image_yscale = 1.5
	
		spawn_fx(x, y, spr_particle_stretch_flash_w, 2)
		spawn_fx(x, y, spr_particle_32_circle_boom, 2)
	
		instance_destroy()
	} else {
		ticks--
		tickCd = tickRate	
	
		var _bolt = instance_create_depth(x, y, depths.ui, obj_particle_single_cycle)
		_bolt.sprite_index = spr_rune_lit_bolt
	
		spawn_fx(x, y, spr_particle_stretch_flash_w)
		spawn_fx(x, y, spr_particle_32_circle_boom)	
	}
	
	var _targets = collision_circle_list(x, y, radius, targets, false, true, collisionList, false)
	ds_list_shuffle(collisionList)
	
	for (var i = 0; i < _targets; i++) {
		var _isCrit = (_curCrits < maxCrits) && (random(1) < critChance)
		
		if (_isCrit) {
			_curCrits++
		}
		
		damage_baddie_with_type(
			collisionList[| i],
			_damage,
			enumDamageTypes.lightning,
			owner,
			_isCrit,
			critMultiplier,
			0.5
		)			
	}
	
	create_fx_fading_circle(x, y, _radius)
	audio_play_sound(snd_paper_slap, 1, 0)
	
	ds_list_clear(collisionList)
}
