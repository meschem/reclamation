///@description   Description
///@return {real}
function get_current_room_reward() {
	with (obj_run_controller) {
		if (currentRoom != -1) {
			return currentRoom.reward
		}
	}
	
	with (obj_room_controller) {
		return reward
	}
	
	show_message("error retrieving reward")
	show_message($"controller count: {instance_number(obj_run_controller)}")
	show_message(obj_run_controller.currentRoom)
	show_message(obj_run_controller.currentRoom.reward)
	
	return -1
}
