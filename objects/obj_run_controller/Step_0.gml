if (game_is_paused()) return

enemyScalingCdCur--

if (enemyScalesWithTime) {
	if (enemyScalingCdCur <= 0) {
		enemyScalingCdCur = enemyScalingCdMax
	
		enemyScalingHp += enemyScalingHpIncrease
		enemyScalingMoveSpeed += enemyScalingMoveSpeedIncrease
	
		create_toaster($"Scaling increased to {enemyScalingHp}")
	}
}
