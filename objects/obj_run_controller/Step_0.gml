if (keyboard_check_released(vk_space)) {
	displayRunInfo = !displayRunInfo
	displayRunStats = !displayRunStats
}

if (game_is_paused()) return

if (!runIsActive) return

runAge++

if (is_main_room_active()) {
	mainRoomAge++
    
    with (obj_door_exit_boss_room) {
        if (!open && other.curseAge > openCurseAmount) {
            openDoor()
        }
    }
	
	if (curseAge < curseAgeMax) {
		curseAge++
	
		if (enemyScalesWithCurse) {
			curseBoostCd--
	
			if (curseBoostCd <= 0) {
				curseBoostCd = mtf(1)
		
				enemyScalingHp += enemyScalingHpIncrease
				enemyScalingMoveSpeed += enemyScalingMoveSpeedIncrease
			}
		}
	} else if (!curseActive) {
		curseActive = true
		create_instance(obj_curse_controller)
	}
}

enemyScalingCdCur--

if (enemyScalesWithTime) {
	if (enemyScalingCdCur <= 0) {
		enemyScalingCdCur = enemyScalingCdMax
	
		enemyScalingHp += enemyScalingHpIncrease
		enemyScalingMoveSpeed += enemyScalingMoveSpeedIncrease
	
		create_toaster($"Scaling increased to {enemyScalingHp}")
	}
}
