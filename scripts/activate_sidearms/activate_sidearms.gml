///@description   Description
function activate_sidearms() {
	for (var i = 0; i < array_length(obj_player.sideArms); i++) {
		if (obj_player.sideArms[i] == playerSideArms.razors) {
			razorCd--

			if (razorCd <= 0) {
				activate_razor()
				razorCd = razorMaxCd
			}
				
		}
	}
}
