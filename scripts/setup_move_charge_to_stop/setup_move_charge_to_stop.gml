///@description   Description
function setup_move_charge_to_stop(_stopDuration = 1, _overshootDistance = 40) {
	moveBehavior = entityMoveBehaviors.chargeToStop
	moveState = enemyMoveStates.stopped
	
	moveChargeOvershootDistance = _overshootDistance
	moveStateStoppedDuration = stf(_stopDuration)
	
	movePoint = new vec2()
	moveStateAge = 0
	moveStateAngle = 0
	moveStateDistance = 0
}
