///@description   Gets the damage for shockwave
///@return {real}

// Want to add % of base damage at certain levels

function get_shockwave_damage() {
	var level = obj_game_controller.talents[talentList.shockwave][talentProps.curLevel]
	
	switch (level) {
		case 1:
			return 10
			break
			
		case 2:
			return 20
			break
			
		case 3:
			return 30
			break
			
		case 4: 
			return 40
			break
		
		default:
			return 50
	}
}