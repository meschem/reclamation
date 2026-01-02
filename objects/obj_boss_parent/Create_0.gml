///@description						Init

// Inherit the parent event
event_inherited()

dropType = enumDropType.baddieFieldBoss

enum genericBossStates {
	init,
	chasing,
	reposition,	
	idle,
	
	attackOne,
	attackTwo,
	attackThree,
	
	dying,
	null
}

enum bsmStateTypes {
	general,
	movement,
	attack,
	dying,
}

///@description						Boss State Machine State
///@param {real} _enum				Enum to reference
///@param {function} _onEnter		Function to execute on entering the state
///@param {function} _onStep		Function to execute per step
///@param {function} _onExit		Function to execute on exiting the state
function bsmState(_enum, _onEnter, _onStep, _onExit = function() {}) constructor {
	stateEnum = _enum
	onEnter = _onEnter
	onStep = _onStep
	onExit = _onExit
	
	exitState = false
	targetState = -1
	
	owner = noone
	bsm = noone
	
	///@description					Transition to a new state
	///param {real} _newState		Enum of new state to transition to
	transition = function(_newState) {
		exitState = true
		targetState = _newState
	}
}

///@description						Sets up a state machine for a boss
///@param {id.Instance} _owner		Owner 
function bossStateMachine(_owner) constructor {
	owner = _owner
	states = {}
	
	lastAttack = -1
	queuedAttack = -1
	validAttacks = []
	deathState = -1
	
	stateAge = 0
	state = undefined
	
	///@description					Run on every step
	runStep = function() {
		if (is_undefined(state)) {
			return
		}
		
		stateAge++
		state.onStep()
		
		if (state.exitState) {
			state.exitState = false
			changeState(state.targetState)
		}
	}
	
	///@description							Add a state
	///@param {struct.bsmState} _state		State to add
	///@param {bool} _stateType				Uses enum bsmStateTypes
	addState = function(_state, _stateType = bsmStateTypes.general) {
		_state.owner = owner
		
		struct_set(states, _state.stateEnum, _state)
		
		//states[_state.stateEnum] = _state
						
		if (_stateType == bsmStateTypes.attack) {
			array_push(validAttacks, _state.stateEnum)
		}
		
		if (_stateType == bsmStateTypes.dying) {
			if (deathState != -1) {
				throw($"Error: Multiple death states set")
				return
			}
			
			deathState = _state.stateEnum
		}
	}
	
	///@description							Change states
	///@param {real} _stateEnum				State enum
	changeState = function (_stateEnum) {
		if (!is_undefined(state)) {
			state.onExit()
		}
		
		var _newState = states[$ _stateEnum];
		
		if (is_undefined(_newState)) {
			throw($"Error: Could not find state with enum {_stateEnum}")
			return
		}
		
		state = _newState
		state.onEnter()
		
		stateAge = 0
	}
	
	///@description					Set the initial state of the machine
	///@param {real} _stateEnum		The enum of the starting state
	setInitialState = function(_stateEnum) {
		changeState(_stateEnum);
	}
}

bsm = new bossStateMachine(id)
owner = 99999

isDying = false

explosionSprite = spr_orange_explosion

name = "Some Boss"
description = "Some boss description"

moveSpeedMax = 0.35
weight = 25
immovable = true
damageDoodads = 100
//wrapAroundBehavior = wrapAroundBehaviors.none

bossScale = 1

hpMax = 1000
hp = hpMax

accel = baddie_move_accel_med
moveSpeedMax = baddie_move_speed_fast
walkAnimType = entityWalkAnimTypes.curves
damageReactionScaleScalar = 0.4

target = noone

create_boss_health_bar(id)

diesAtZeroHp = false

deathParticles = []

dyingDrops = [
	obj_health_globe_sm,
	obj_health_globe_sm,
]				// drops while exploding

onDestroy = function() {
	//curse_increase_max(1)
}
