/// @description Init

// window_set_fullscreen(true)

enum roomStates {
	playing,
	pauseMenu,
	upgradeMenu,
	completed
}

state = roomStates.playing

age = 0

isPaused = false
timeDisplay = "0:00"

nextLevel = rm_start_dev

create_instance(obj_buff_controller)
create_instance(obj_camera_controller)

///@description			Builds a set of teleport locations to be utilized in the room
buildTeleportLocations = function() {
	var count = 40
	var maxTries = 100
	var sizeCheck = 32
	var point = new vec2()
	
	for (var i = 0; i < maxTries; i++) {
		
	}
}