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
	bossFlourish,
	endScreen,
}

enum roomCategories {
	combat,				// normal combat, ends when no enemies or spawners are alive
	combatSingle,		// normal combat, ends when told
	shop,				// a shop!
	stats,				// shows stats. unused?
	inactive,			// player is inactive
	boss,				// driven by killing a boss
	endScreen,			// score screen
}

enum combatRoomTypes {
	dungeon,
	openArea
}

category = roomCategories.combat
combatRoomType = combatRoomTypes.openArea

bossName = "Unset on obj_room_controller"
bossTitle = "Unset on obj_room_controller"
bossSprite = spr_none

state = roomStates.init

age = 0

pauseDelay = 0
timeDisplay = "0:00"
timerActive = true
showTimeDisplay = true
singleRoomCombatComplete = false
allowBaddieWrap = true

chestSpawnRange = {
	xMin: 0,
	xMax: -1,
	yMin: 0,
	yMax: -1
}

spawnerPhaseDuration = 60 * 30 // fps * 30 seconds

overtimeLength = seconds_to_frames(5)
overtimeAge = 0

nextLevel = rm_start_dev

pauseMenuEnabled = true

reward = roomRewards.gold

create_instance(obj_buff_controller)
create_instance(obj_camera_controller)
create_instance(obj_particle_controller)
create_instance(obj_sound_controller)
create_instance(obj_event_controller)
create_instance(obj_dormancy_controller)

spawner = create_instance(obj_spawner_controller)
finalLevel = false
cameraOffset = new vec2()

// ROOM SETUP
// use obj_dungeon to create spawn phases

pause = false
hitStun = 0

///@description			Manual checks pause state based on active UI components
updatePauseState = function() {
	var _paused = false
	
	with (obj_menu) {
		if (!closing) {
			_paused = true
		}
	}
	
	with (obj_backpack) {
		if (isOpen) {
			_paused = true
		}
	}
	
	pause = _paused
}

isPaused = function() {
	if (hitStun > 0) {
		return true
	}
	
	if (category == roomCategories.inactive) {
		return true
	}
	
	return pause
}

createHitStun = function(_amount) {
	if (!pause && hitStun < _amount) {
		hitStun = _amount	
	}
}

initStats = function() {
	state = roomStates.statsMenu
}

initBoss = function() {
	var _inst = create_instance(obj_boss_flourish_controller)
	
	_inst.bossName = bossName
	_inst.bossTitle = bossTitle
	_inst.bossSprite = bossSprite
	
	state = roomStates.bossFlourish
}

initCombat = function() {
	showTimeDisplay = true
	timerActive = true
	runIsActive = true
	
	with (obj_ui_controller) {
		drawStatBars = true
		skipPlayerUi = false
	}
	
	with (obj_ability) {
		drawGui = true
	}
	
	if (obj_run_controller.endScreen) {
		state = roomStates.endScreen
		create_toaster("End Screen. No Combat.")
		return 0
	}
	
	if (is_main_room_active()) {
		age = obj_run_controller.mainRoomAge
		
		with (obj_spawner) {
			age = obj_run_controller.mainRoomAge
			
		}
		
		// Run once per map init in a run
		if (!obj_run_controller.mainRoomInit) {
			process_map_events()
			setup_chests_on_map()
			
			obj_run_controller.mainRoomInit = true
			
			with (obj_room_exit) {
				add_map_poi()
			}
			
			with (obj_merchant_merger_zone) {
				add_map_poi()
			}
		} else {
			cleanup_map_events()
		}
		
		spawn_stored_baddies()
	}
	
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

initEndScreen = function() {
	state = roomStates.endScreen
	showTimeDisplay = false
	timerActive = false
	runIsActive = false
	
	disable_pause_menu()
	disable_player_controls()
	create_run_stats_menu()
	
	with (obj_ui_controller) {
		drawStatBars = false
	}
	
	with (obj_ability) {
		drawGui = true
	}
}

initShopping = function() {
	state = roomStates.shopping
	showTimeDisplay = false
	timerActive = false
	runIsActive = false
	
	with (obj_merchant_zone) {
		addEquipment(get_current_difficulty_level())
	}
	
	with (obj_ui_controller) {
		drawStatBars = true
	}
	
	with (obj_ability) {
		drawGui = true
	}
}

initInactive = function() {
	state = roomStates.playing
	showTimeDisplay = false
	timerActive = false
	runIsActive = false
		
	with (obj_ui_controller) {
		drawStatBars = false
		skipPlayerUi = true
	}
		
	with (obj_ability) {
		drawGui = false
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
			if (type == runTypes.singleArea) {
				if (!is_main_room_active()) {
					room_goto(mainRoom)
					return 0
				}
			}
			
			if (dungeon == noone) {
				endScreen = true
				room_goto(finalLevelRoom)
				return 0
			}
			
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
