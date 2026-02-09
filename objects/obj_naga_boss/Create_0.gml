///@description						Init

// Inherit the parent event
event_inherited()

enum nagaBossStates {
	init,
	idleAggressive,
	idleMover,
	reposition,
	dying,
	null,
	acidLob,
	acidLaser,
}

name = "Vileborne Naga"
description = "Venomous Serpent Mother"

moveSpeedMax = 0.5
chargeSpeedMax = 1.5
weight = 25
immovable = true

bossScale = 1

hpMax = 1500
hp = hpMax

accel = baddie_move_accel_med
moveSpeedMax = baddie_move_speed_fast
walkAnimType = entityWalkAnimTypes.sprite
damageReactionScaleScalar = 0.4

target = noone

create_boss_health_bar(id)

onDestroy = function() {
	curse_increase_max(1)		
	instance_create_depth(x, y, depths.enemy, obj_ore)
}

dyingDrops = [
	obj_health_globe_sm,
	obj_health_globe_sm
]

deathParticles = [
	obj_ptb_serpent_chunk_grn,
	obj_ptb_serpent_chunk_grn,
	obj_ptb_serpent_chunk_grn,
	obj_ptb_serpent_chunk_grn,
	obj_ptb_serpent_chunk_grn,
	obj_ptb_serpent_chunk_grn,
	obj_ptb_serpent_chunk_grn,
	obj_ptb_serpent_chunk_grn,
	obj_ptb_serpent_chunk_grn,
	obj_ptb_serpent_chunk_grn
]

stateInit = new bsmState(
	genericBossStates.init,
	function() {
		xVel = 0
		yVel = 0
		moveBehavior = entityMoveBehaviors.none
	},
	
	function() {
		if (bsm.stateAge > stf(1.5)) {
			bsm.state.transition(genericBossStates.reposition)
			//bsm.state.transition(genericBossStates.chasing)
		}
	},	
)

stateChasing = new bsmState(
	genericBossStates.chasing,
	function() {
		moveBehavior = entityMoveBehaviors.charge
	},
	function() {
		if (bsm.stateAge > stf(3)) {
			bsm.state.transition(genericBossStates.attackOne)
		}
	}
)

stateAttackOne = new bsmState(
	genericBossStates.attackOne,
	function() {
		moveBehavior = entityMoveBehaviors.charge
	},
	function() {
		if (bsm.stateAge % 60 == 0) {
			var _target = get_player_target()
			baddie_attack_lob_shot_predicted(obj_acid_lob_shot, _target, 3, x, y, 16)
		}
		
		if (bsm.stateAge > stf(3)) {
			bsm.state.transition(genericBossStates.idle)
		}
	}
)

stateIdle = new bsmState(
	genericBossStates.idle,
	function() {
		xVel = 0
		yVel = 0
		moveBehavior = entityMoveBehaviors.none
	},	
	function() {
		if (bsm.stateAge > stf(1)) {
			if (hp / hpMax < 0.66 && random(1) > 0.33) {
				bsm.state.transition(genericBossStates.chasing)
			} else {
				bsm.state.transition(genericBossStates.reposition)
			}
		}
	},
)

stateChargeToLaser = new bsmState(
	genericBossStates.reposition,
	function() {
		target = get_player_target()
		
		var _overShootDistance = 40
		var _angle = point_direction(x, y, target.x, target.y)
		var _overShootVec2 = get_vec2_from_angle_mag(_angle, _overShootDistance)
		var _targetPointX = _overShootVec2.x + target.x
		var _targetPointY = _overShootVec2.y + target.y
		var _moveDistanceMax = point_distance(x, y, _targetPointX, _targetPointY)
		
		xVel = 0
		yVel = 0
		
		moveBehavior = entityMoveBehaviors.none
		moveAngle = _angle
		moveDistanceMax = _moveDistanceMax
		moveDistance = 0
		
		bsm.state.lastPointX = x
		bsm.state.lastPointY = y
		
		xVel = angle_xvel(_angle)
		yVel = angle_yvel(_angle)
	},
	function() {
		moveDistance += point_distance(
			bsm.state.lastPointX,
			bsm.state.lastPointY,
			x, y
		)
		
		bsm.state.lastPointX = x
		bsm.state.lastPointY = y
		
		if (moveDistance > moveDistanceMax || bsm.stateAge >= stf(4)) {
			bsm.state.transition(genericBossStates.attackTwo)
		} else {
			accelerate(accel, id, 0, chargeSpeedMax)
		}	
	}
)

stateAttackTwo = new bsmState(
	genericBossStates.attackTwo,
	function() {
		moveBehavior = entityMoveBehaviors.none
		bsm.state.firing = false
	},
	function() {
		var _mag = deaccelerate(0.4)
		
		if (!bsm.state.firing && _mag == 0) {
			bsm.state.firing = true
			
			for (var i = 0; i < 4; i++) {
				var _inst = instance_create_depth(x, y, depths.enemyProjectile, obj_enemy_laser_naga)
	
				_inst.image_angle = 90 * i
			}
		}
		
		if (bsm.stateAge >= stf(3)) {
			bsm.state.transition(genericBossStates.idle)
		}
	}
)

stateDying = bsm_create_state_dying()

bsm.addState(stateInit)
bsm.addState(stateIdle)
bsm.addState(stateChasing)
bsm.addState(stateChargeToLaser)
bsm.addState(stateAttackOne, bsmStateTypes.attack)
bsm.addState(stateAttackTwo, bsmStateTypes.attack)
bsm.addState(stateDying, bsmStateTypes.dying)

bsm.setInitialState(stateInit.stateEnum)