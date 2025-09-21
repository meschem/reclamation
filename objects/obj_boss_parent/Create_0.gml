///@description						Init

// Inherit the parent event
event_inherited()

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

owner = 99999

//stateInit = new bsmState(
//	genericBossStates.init,
//	function() {
//		xVel = 0
//		yVel = 0
//		moveBehavior = entityMoveBehaviors.none
//	},
	
//	function() {
//		if (bsm.stateAge > stf(1.5)) {
//			bsm.state.transition(genericBossStates.reposition)
//			//bsm.state.transition(genericBossStates.chasing)
//		}
//	},	
//)

//stateChasing = new bsmState(
//	genericBossStates.chasing,
//	function() {
//		moveBehavior = entityMoveBehaviors.charge
//	},
//	function() {
//		if (bsm.stateAge > stf(3)) {
//			bsm.state.transition(genericBossStates.attackOne)
//		}
//	}
//)

//stateAttackOne = new bsmState(
//	genericBossStates.attackOne,
//	function() {
//		moveBehavior = entityMoveBehaviors.charge
//	},
//	function() {
//		if (bsm.stateAge % 60 == 0) {
//			var _target = get_player_target()
//			baddie_attack_lob_shot_predicted(obj_acid_lob_shot, _target, 3, x, y, 16)
//		}
		
//		if (bsm.stateAge > stf(3)) {
//			bsm.state.transition(genericBossStates.idle)
//		}
//	}
//)

//stateIdle = new bsmState(
//	genericBossStates.idle,
//	function() {
//		xVel = 0
//		yVel = 0
//		moveBehavior = entityMoveBehaviors.none
//	},	
//	function() {
//		if (bsm.stateAge > stf(1)) {
//			if (hp / hpMax < 0.66 && random(1) > 0.5) {
//				bsm.state.transition(genericBossStates.chasing)
//			} else {
//				bsm.state.transition(genericBossStates.reposition)
//			}
//		}
//	},
//)

//stateChargeToLaser = new bsmState(
//	genericBossStates.reposition,
//	function() {
//		target = get_player_target()
		
//		var _overShootDistance = 40
//		var _angle = point_direction(x, y, target.x, target.y)
//		var _overShootVec2 = get_vec2_from_angle_mag(_angle, _overShootDistance)
//		var _targetPointX = _overShootVec2.x + target.x
//		var _targetPointY = _overShootVec2.y + target.y
//		var _moveDistanceMax = point_distance(x, y, _targetPointX, _targetPointY)
		
//		xVel = 0
//		yVel = 0
		
//		moveBehavior = entityMoveBehaviors.none
//		moveAngle = _angle
//		moveDistanceMax = _moveDistanceMax
//		moveDistance = 0
		
//		bsm.state.lastPointX = x
//		bsm.state.lastPointY = y
		
//		xVel = angle_xvel(_angle)
//		yVel = angle_yvel(_angle)
//	},
//	function() {
//		moveDistance += point_distance(
//			bsm.state.lastPointX,
//			bsm.state.lastPointY,
//			x, y
//		)
		
//		bsm.state.lastPointX = x
//		bsm.state.lastPointY = y
		
//		if (moveDistance > moveDistanceMax || bsm.stateAge >= stf(4)) {
//			bsm.state.transition(genericBossStates.attackTwo)
//		} else {
//			accelerate(accel, id, 0, moveSpeedMax * 3)
//		}	
//	}
//)

//stateAttackTwo = new bsmState(
//	genericBossStates.attackTwo,
//	function() {
//		moveBehavior = entityMoveBehaviors.none
//		bsm.state.firing = false
//	},
//	function() {
//		var _mag = deaccelerate(0.4)
		
//		if (!bsm.state.firing && _mag == 0) {
//			bsm.state.firing = true
			
//			for (var i = 0; i < 4; i++) {
//				var _inst = instance_create_depth(x, y, depths.enemyProjectile, obj_enemy_laser_naga)
	
//				_inst.image_angle = 90 * i
//			}
//		}
		
//		if (bsm.stateAge >= stf(3)) {
//			bsm.state.transition(genericBossStates.idle)
//		}
//	}
//)

//stateDying = new bsmState(
//	genericBossStates.dying,
//	function() {
//		xVel = 0
//		yVel = 0
//		moveBehavior = entityMoveBehaviors.none
//		isDying = true
//	},
//	function() {
//		if (bsm.stateAge % 14 == 0) {
//			var _boom = instance_create_depth(
//				x + irandom_range(-20, 20),
//				y + irandom_range(-20, 20),
//				depth - 100,
//				obj_particle_single_cycle
//			)
			
//			_boom.sprite_index = explosionSprite
		
//			audio_play_sound(snd_fireball_impact_short, 0, false)
		
//			spawn_fx_bouncers(
//				array_random(deathParticles),
//				random(360),
//				random_range(0.6, 1.2)
//			)
//		}
		
//		if (bsm.stateAge > 14 * 16 - 1) {
//			var _boom = instance_create_depth(x, y, depth - 110, obj_particle_single_cycle)
//			_boom.sprite_index = explosionSprite
//			_boom.image_xscale = 2
//			_boom.image_yscale = 2
		
//			audio_play_sound(snd_fireball_impact_crunchy_echo, 0, false)
			
//			instance_destroy()
//		}
//	}
//)

//bsm = new bossStateMachine(id)

//bsm.addState(stateInit)
//bsm.addState(stateIdle)
//bsm.addState(stateChasing)
//bsm.addState(stateChargeToLaser)
//bsm.addState(stateAttackOne, bsmStateTypes.attack)
//bsm.addState(stateAttackTwo, bsmStateTypes.attack)
//bsm.addState(stateDying, bsmStateTypes.dying)

//bsm.setInitialState(stateInit.stateEnum)

isDying = false

explosionSprite = spr_orange_explosion

name = "Some Boss"
description = "Some boss description"

moveSpeedMax = 0.35
weight = 25
immovable = true
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

onDestroy = function() {
	//curse_increase_max(1)
}