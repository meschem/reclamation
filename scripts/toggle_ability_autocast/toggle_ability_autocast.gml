///@description   Description
function toggle_ability_autocast() {
	with (obj_ability) {
		if (canAutoCast) {
			autoCast = !autoCast
		}
	}
}