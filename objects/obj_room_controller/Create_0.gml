/// @description Init

// window_set_fullscreen(true)

enum roomStates {
	init,
	playing,
	shopping,
	statsMenu,
	pauseMenu,
	upgradeMenu,
	overtime,
	completed,
}

enum roomCategories {
	combat,
	shop,
	stats
}

category = roomCategories.combat

state = roomStates.init

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

initStats = function() {
	state = roomStates.statsMenu
}

initCombat = function() {
	state = roomStates.playing
}

completeCombat = function() {
	display_level_trinket_prompt()

	initOvertime()
}

initShopping = function() {
	state = roomStates.shopping
}

completeShopping = function() {
	initOvertime()
}

initOvertime = function() {
	state = roomStates.overtime
}

completeOvertime = function() {
	obj_run_controller.challengeLevel++
		
	if (finalLevel) {
		restart_run()
	} else {
		with (obj_run_controller) {
			currentFloor++
				
			if (currentFloor == dungeon.floorCount) {
				restart_run()
			}
				
			var _success = display_room_select_prompt()
				
			if (!_success) {
				room_goto(rm_dungeon_end)
			}
				
			//loadRoom(dungeon.floors[currentFloor].rooms[0])
		}
	}	
}