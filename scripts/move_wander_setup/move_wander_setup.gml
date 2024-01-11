///@description   Applies variables for a waneder movement behavior
function move_wander_setup(_cdMin = 120, _cdMax = 240, _wanderTime = 120) {
	movementType = enemyMoveBehaviors.wander
	
	wanderCdMin = _cdMin
	
	wanderCdMax = _cdMax
	wanderCdCur = wanderCdMax
	
	wanderTimeMax = _wanderTime
	wanderTimeCur = 0
}