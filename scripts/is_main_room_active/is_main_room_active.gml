///@description			Returns whether or not we are currently in the main room
///@return {bool}

function is_main_room_active() {
	if (obj_run_controller.type == runTypes.dungeon) {
		return true
	}
	
	if (obj_run_controller.type == runTypes.singleArea) {
		if (obj_run_controller.mainRoom == room) {
			return true
		}
		
		return false
	}
	
	return true
}
