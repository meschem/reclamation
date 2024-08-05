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
	endScreen,
}

enum roomCategories {
	combat,
	shop,
	stats,
	inactive,
}

category = roomCategories.combat

state = roomStates.init

age = 0

isPaused = false
pauseDelay = 0
timeDisplay = "0:00"

overtimeLength = seconds_to_frames(5)
overtimeAge = 0

nextLevel = rm_start_dev

hihihihihi = false

create_instance(obj_buff_controller)
create_instance(obj_camera_controller)
create_instance(obj_particle_controller)
create_instance(obj_sound_controller)

spawner = create_instance(obj_spawner_controller)
finalLevel = false

// ROOM SETUP
// use obj_dungeon to create spawn phases

//if (instance_number(obj_dungeon) > 0) {
//	obj_run_controller.currentRoom.setupSpawner()
	
	//if (obj_run_controller.currentFloor == array_length(obj_dungeon.floors) - 1) {
	//	finalLevel = true
	//} else {
	//	nextLevel = obj_dungeon.floors[obj_run_controller.currentFloor + 1].rooms[0].roomId
	//}
//}

initStats = function() {
	state = roomStates.statsMenu
}

initCombat = function() {
	if (obj_run_controller.endScreen) {
		state = roomStates.endScreen
		create_toaster("End Screen. No Combat.")
		return 0
	}
	
	create_toaster("Initiating Combat")
	if (instance_number(obj_dungeon) > 0) {
		create_toaster("Setting up Spawner")
		obj_run_controller.currentRoom.setupSpawner()
	
		//if (obj_run_controller.currentFloor == array_length(obj_dungeon.floors) - 1) {
		//	finalLevel = true
		//} else {
		//	nextLevel = obj_dungeon.floors[obj_run_controller.currentFloor + 1].rooms[0].roomId
		//}
	}

	state = roomStates.playing
}

completeCombat = function() {
	var _reward = get_current_room_reward()

	process_room_reward(_reward)

	initOvertime()
}

initShopping = function() {
	state = roomStates.shopping
	
	with (obj_merchant_zone) {
		addEquipment(get_current_difficulty_level())
	}
}

completeShopping = function() {
	initOvertime()
}

initOvertime = function() {
	state = roomStates.overtime
}

completeOvertime = function() {
	obj_run_controller.challengeLevel++
	obj_particle_controller.roomCleanup()
		
	if (finalLevel) {
		show_message("restarting run finalLevel")
		restart_run()
	} else {
		with (obj_player) {
			state = playerStates.idle
		}
		
		with (obj_run_controller) {
			currentFloor++
				
			if (currentFloor == dungeon.floorCount) {
				endScreen = true
				room_goto(finalLevelRoom)
			}
				
			var _success = display_room_select_prompt()
				
			if (!_success) {
				endRunCombat()
				room_goto(finalLevelRoom)
			}
				
			//loadRoom(dungeon.floors[currentFloor].rooms[0])
		}
	}	
}
