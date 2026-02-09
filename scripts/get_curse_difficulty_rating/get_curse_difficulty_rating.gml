///@description                     Returns the "rating" of curse difficulty: effectively, number of skulls highlighted
///@return {real}
function get_curse_difficulty_rating() {
	with (obj_run_controller) {
		var _difficulty = floor(curseAge / mtf(1))
        
        return _difficulty
	}
}
