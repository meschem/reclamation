/// @description 

age++

if (age % 4 == 0) {
	//init
	var _angle = 90 + (degOffset / 2) * orbsCur
	var _spawnPos = get_vec2_from_angle_mag(_angle, spawnRadius)
	
	//spawn orb 1
	delayed_ice_blast(
		x + spawnOffset.x + _spawnPos.x,
		y + spawnOffset.y + _spawnPos.y,
	)
	
	delayed_ice_blast(
		x + spawnOffset.x - _spawnPos.x,
		y + spawnOffset.y - _spawnPos.y,
	)
	
	orbsCur += 2
}

if (orbsCur >= orbsTotal) {
	instance_destroy()
}