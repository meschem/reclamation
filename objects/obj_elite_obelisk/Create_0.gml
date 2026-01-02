
event_inherited()

add_map_poi(id, spr_poi_obelisk)

activate = function() {
	var _spawn = array_random(baddies)
	
	// this ultimate spawns one, and enhance_baddie() creates the supporting  units
	var _spawns = spawn_baddie(_spawn, 1, 20)
	
	for (var i = 0; i < array_length(_spawns); i++) {
		create_elite_health_bar(_spawns[i])
		enhance_baddie(baddieSpecialTypes.elite, _spawns[i])
		apply_random_elite_buff(_spawns[i])
	}
	
	instance_destroy()
}
