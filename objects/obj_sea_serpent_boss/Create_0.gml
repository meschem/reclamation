///@description						Init

// Inherit the parent event
event_inherited()

name = "Great Sea Serpent"
description = "Nemesis from the Seas"

weight = 25
immovable = true

bossScale = 1

hpMax = 1250
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
			bsm.state.transition(genericBossStates.chasing)
		}
	},	
)

stateChasing = new bsmState(
	genericBossStates.chasing,
	function() {
		moveBehavior = entityMoveBehaviors.charge
		var _min = stf(3)
		var _max = stf(6)
		bsm.stateAgeMax = random_range(_min, _max)
	},
	function() {
		if (bsm.stateAge > bsm.stateAgeMax) {
			bsm.state.transition(genericBossStates.attackOne)
		}
	}
)

stateAttackOne = new bsmState(
	genericBossStates.attackOne,
	function() {
		xVel = 0
		yVel = 0
		moveBehavior = entityMoveBehaviors.none
		bsm.state.shotCount = 0
		bsm.state.shotCountMax = 12
		bsm.state.fireAngle = 0
	},
	function() {
		if (bsm.stateAge > stf(1) && bsm.stateAge % 7 == 0) {
			if (bsm.state.shotCount == 0) {
				var _target = get_player_target()
				bsm.state.fireAngle = point_direction(x, y, _target.x, _target.y)
			}
			
			var _mag = 30 + bsm.state.shotCount * 30
			var _x = x + (angle_xvel(bsm.state.fireAngle) * _mag)
			var _y = y + (angle_yvel(bsm.state.fireAngle) * _mag)
			var _projectile = (bsm.state.shotCount % 2 == 0) ? obj_ice_lob_shot : obj_ice_lob_shot_sea_serpent
			
			baddie_attack_lob_shot(_projectile, _x, _y, x, y, 20)
			
			bsm.state.shotCount++
		}
		
		if (bsm.state.shotCount >= bsm.state.shotCountMax || bsm.stateAge > stf(10)) {
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
			bsm.state.transition(genericBossStates.chasing)
		}
	},
)

stateDying = bsm_create_state_dying()

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

bsm.addState(stateInit)
bsm.addState(stateIdle)
bsm.addState(stateChasing)
bsm.addState(stateAttackOne, bsmStateTypes.attack)
bsm.addState(stateDying, bsmStateTypes.dying)

bsm.setInitialState(stateInit.stateEnum)