///@description   Gets the damage for shockwave
///@param {real} level
///@return {real}

// Want to add % of base damage at certain levels

function get_shockwave_damage(level) {
	switch (level) {
		case 1:
			return 10
			
		case 2:
			return 20
			
		case 3:
			return 30
			
		case 4: 
			return 40
		
		default:
			return 50
	}
}