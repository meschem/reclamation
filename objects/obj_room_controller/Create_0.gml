/// @description Init

// window_set_fullscreen(true)

enum roomStates {
	playing,
	pauseMenu,
	upgradeMenu,
	overtime,
	completed
}

state = roomStates.playing

age = 0

isPaused = false
timeDisplay = "0:00"

overtimeLength = seconds_to_frames(5)
overtimeAge = 0

nextLevel = rm_start_dev

create_instance(obj_buff_controller)
create_instance(obj_camera_controller)

spawner = create_instance(obj_spawner_controller)
finalLevel = false

// use obj_dungeon to create spawn phases
if (instance_number(obj_dungeon) > 0) {
	obj_run_controller.currentRoom.setupSpawner()
	
	if (obj_run_controller.currentFloor == array_length(obj_dungeon.floors) - 1) {
		finalLevel = true
	} else {
		nextLevel = obj_dungeon.floors[obj_run_controller.currentFloor + 1].rooms[0].roomId
	}
}

///@description			Builds a set of teleport locations to be utilized in the room
//buildTeleportLocations = function() {
//	var count = 40
//	var maxTries = 100
//	var sizeCheck = 32
//	var point = new vec2()
	
//	for (var i = 0; i < maxTries; i++) {
		
//	}
//}