///@description   Applies variables for a waneder movement behavior
///@param {real} _cdMin
///@param {real} _cdMax
///@param {real} _wanderTime
function move_wander_setup(_cdMin = 30, _cdMax = 80, _wanderTime = 110) {
	moveBehavior = entityMoveBehaviors.wander
	
	wanderCdMin = _cdMin
	
	wanderCdMax = _cdMax
	wanderCdCur = wanderCdMax
	
	wanderTimeMax = _wanderTime
	wanderTimeCur = 0
}
