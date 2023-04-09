/// @description Init

// window_set_fullscreen(true)

enum roomStates {
	playing,
	pauseMenu,
	upgradeMenu,
	completed
}

state = roomStates.playing

//skellySpawnCdMax = 45
//skellySpawnCd = skellySpawnCdMax

//skellyWarriorCdMax = 600
//skellyWarriorCd = skellyWarriorCdMax

//wraithCdMax = 900
//wraithCd = wraithCdMax

age = 0

isPaused = false
timeDisplay = "0:00"
