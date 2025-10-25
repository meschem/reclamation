// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_ability_icon_position_x(_index) {
	switch (_index) {
		case 0: return 229
		case 1: return 262
		case 2: return 345
		case 3: return 379
		case 4: return 298	// ultimate
	}
	
	create_toaster("Invalid ability index requested for position X: " + string(_index), errorLevels.error)
}

function get_ability_icon_position_y(_index) {
	switch (_index) {
		case 0: return 288
		case 1: return 288
		case 2: return 288
		case 3: return 288
		case 4: return 276	// ultimate
	}
	
	create_toaster("Invalid ability index requested for position Y: " + string(_index), errorLevels.error)
}