///@description   Checks for soul gate on baddie death
function check_for_soul_gate(_baddie = id) {
	with (obj_soul_gate) {
		if (point_distance(_baddie.x, _baddie.y, x, y) < range) {
			eatSoul(_baddie)
		}
	}
	
	with (obj_infernal_wave_summoner) {
		killCount++
		
		create_toaster("Infernal Wave Fed")
	}
}
