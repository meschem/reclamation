///@description						Sets up a basic init state where the AI is idle for X seconds
///@param {real} _initState			Initial state enum. Uses bossStates enum.
///@param {real} _transitionState	State to transition to. Uses bossStates enum.
///@param {real} _idleTime			Time to sit still
function bsm_create_state_init(_initState, _transitionState, _idleTime = stf(1.5)) {
	show_message(_transitionState)
	var _state = new bsmState(
		_initState,
		function() {
			xVel = 0
			yVel = 0
			moveBehavior = entityMoveBehaviors.none
		},
	
		function(_state = _transitionState, _time = _idleTime) {
			if (bsm.stateAge > _time) {
				bsm.state.transition(_state)
			}
		},	
	)
	
	return _state
}
