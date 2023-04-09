/// @description	Description
/// @param {real}	sidearm to add

function add_sidearm(sidearm) {
	with (obj_player) {
		obj_player.sideArms[array_length(obj_player.sideArms)] = sidearm
	
		switch (sidearm) {
			case playerSideArms.razors:
				razorCd = 12 * fps
				razorMaxCd = razorCd
			break
		}
	}
}