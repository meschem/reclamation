if (game_is_paused()) return

runAge++

if (is_main_room_active()) {
	mainRoomAge++
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
