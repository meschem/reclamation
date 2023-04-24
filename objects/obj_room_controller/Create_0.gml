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
