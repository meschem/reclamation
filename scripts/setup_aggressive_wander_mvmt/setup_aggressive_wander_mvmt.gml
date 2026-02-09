///@description   Description
function setup_aggressive_wander_mvmt() {
	distanceToTargetMin = 15
	distanceToTargetMax = 70
	distanceToTargetOptimal = 45
	distanceCheckRate = stf(1)

	wanderDistanceMax = 150
	wanderDistanceMin = 50

	moveTarget = new vec2(x, y)
	moveTargetCdMax = stf(4)
	moveTargetCdCur = 0
	moveTargetCushion = 8

	target = instance_nearest(x, y, obj_baddie)
	acquireTargetRate = stf(4)
}
