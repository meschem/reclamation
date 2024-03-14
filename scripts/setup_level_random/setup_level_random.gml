///@description						Gets a "random" setup for a room based on difficulty
///@param {real} challengeLevel		Overall room difficulty
function setup_level_random(challengeLevel = -1) {
	if (challengeLevel = -1) {
		challengeLevel = obj_run_controller.challengeLevel
	}
	
	switch (challengeLevel) {
		case 1:
			setup_level_easy_skels()
		break
		
		case 2:
			
		break
		
		case 3:
		
		break
		
		default:
		
		break
	}
}