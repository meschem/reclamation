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

// ROOM SETUP
// use obj_dungeon to create spawn phases

if (instance_number(obj_dungeon) > 0) {
	obj_run_controller.currentRoom.setupSpawner()
	
	//if (obj_run_controller.currentFloor == array_length(obj_dungeon.floors) - 1) {
	//	finalLevel = true
	//} else {
	//	nextLevel = obj_dungeon.floors[obj_run_controller.currentFloor + 1].rooms[0].roomId
	//}
}
