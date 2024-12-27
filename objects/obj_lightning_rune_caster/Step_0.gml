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
	if (ticks == 1) {
		damage_baddies_in_radius(new vec2(x, y), explosionRadius, explosionDamage, owner, critChance, maxCrits)

		create_fx_fading_circle(x, y, explosionRadius)
	
		var _bolt = instance_create_depth(x, y, depths.ui, obj_particle_single_cycle)
		_bolt.sprite_index = spr_rune_lit_bolt
		_bolt.image_xscale = 1.5
		_bolt.image_yscale = 1.5
	
		spawn_fx(x, y, spr_particle_stretch_flash_w, 2)
		spawn_fx(x, y, spr_particle_32_circle_boom, 2)
		audio_play_sound(snd_paper_slap, 1, 0)
	
		instance_destroy()
	} else {
		ticks--
		tickCd = tickRate
		
		damage_baddies_in_radius(new vec2(x, y), radius, damagePerTick, owner, critChance, maxCrits)
	
		create_fx_fading_circle(x, y, radius)
	
		var _bolt = instance_create_depth(x, y, depths.ui, obj_particle_single_cycle)
		_bolt.sprite_index = spr_rune_lit_bolt
	
		spawn_fx(x, y, spr_particle_stretch_flash_w)
		spawn_fx(x, y, spr_particle_32_circle_boom)
	
		audio_play_sound(snd_paper_slap, 1, 0)
	}
}

//if (age >= duration) {
//	damage_baddies_in_radius(new vec2(x, y), explosionRadius, explosionDamage, owner, critChance, maxCrits)

//	create_fx_fading_circle(x, y, explosionRadius)
	
//	var _bolt = instance_create_depth(x, y, depths.ui, obj_particle_single_cycle)
//	_bolt.sprite_index = spr_rune_lit_bolt
//	_bolt.image_xscale = 1.5
//	_bolt.image_yscale = 1.5
	
//	spawn_fx(x, y, spr_particle_stretch_flash_w, 2)
//	spawn_fx(x, y, spr_particle_32_circle_boom, 2)
//	audio_play_sound(snd_paper_slap, 1, 0)
	
//	instance_destroy()
//} else if (age % tickRate == 0) {
//	damage_baddies_in_radius(new vec2(x, y), radius, damagePerTick, owner, critChance, maxCrits)
	
//	create_fx_fading_circle(x, y, radius)
	
//	var _bolt = instance_create_depth(x, y, depths.ui, obj_particle_single_cycle)
//	_bolt.sprite_index = spr_rune_lit_bolt
	
//	spawn_fx(x, y, spr_particle_stretch_flash_w)
//	spawn_fx(x, y, spr_particle_32_circle_boom)
	
//	audio_play_sound(snd_paper_slap, 1, 0)
//}
