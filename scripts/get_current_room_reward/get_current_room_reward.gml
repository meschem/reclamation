///@description   Description
///@return {real}
function get_current_room_reward() {
	with (obj_run_controller) {
		if (currentRoom != -1) {
			return currentRoom.reward
		}		
	}
	
	create_toaster("No reward set in room", errorLevels.warning)
	
	return -1
}
