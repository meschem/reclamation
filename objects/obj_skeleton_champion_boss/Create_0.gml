/// @description Init

event_inherited();

name = "Incendius"
description = "Forged from the Ceaseless Fire"

walkAnimType = entityWalkAnimTypes.curves

moveSpeedMax = baddie_move_speed_fast
xp = baddie_xp_boss
pushRadius = baddie_push_radius_large

hpMax = 1000
hp = hpMax

shadowSprite = spr_shadow_xxl
shadowOffset = -9

image_index = floor(random(sprite_get_number(sprite_index)))

deathParticles = [
	obj_ptb_skel_bone_red,
	obj_ptb_skel_bone_red,
	obj_ptb_skel_bone_red,
	obj_ptb_skel_bone_red,
	obj_ptb_skel_bone_red,
	obj_ptb_skel_bone_red,
	obj_ptb_skel_bone_red,
	obj_ptb_skel_bone_red,
	obj_ptb_skel_ribs_red,
	obj_ptb_skel_skull_red,
]

stateInit = new bsmState(
	genericBossStates.init,
	function() {
		xVel = 0
		yVel = 0
		moveBehavior = entityMoveBehaviors.none
	},
	
	function() {
		if (bsm.stateAge > stf(2)) {
			bsm.state.transition(genericBossStates.chasing)
		}
	},	
)

stateChasing = new bsmState(
	genericBossStates.chasing,
	function() {
		create_toaster("chasing")
		var _min = stf(3.5)
		var _max = stf(7.5)
		bsm.stateAgeMax = random_range(_min, _max)
		moveBehavior = entityMoveBehaviors.charge
	},
	function() {
		if (bsm.stateAge > bsm.stateAgeMax) {
			bsm.state.transition(genericBossStates.attackOne)
		}
	}
)

stateMegaOrb = new bsmState(
	genericBossStates.attackOne,
	function() {
		create_toaster("attacking")
		xVel = 0
		yVel = 0
		moveBehavior = entityMoveBehaviors.none
		bsm.state.firePhase = 0
		bsm.state.fireAngle = 0
		bsm.stateAgeMax = stf(3)
	},
	function() {
		if (bsm.state.firePhase == 0 && bsm.stateAge > stf(1)) {
			bsm.state.firePhase++
			
			var _target = get_player_target()
			bsm.state.fireAngle = point_direction(x, y, _target.x, _target.y)
			
			launch_projectile(obj_enemy_red_shot_massive, bsm.state.fireAngle, 0.5)
		}
		
		if (bsm.state.firePhase == 1 && bsm.stateAge > stf(1.6)) {
			bsm.state.firePhase++
						
			launch_projectile(obj_enemy_red_shot_massive, bsm.state.fireAngle + 15, 0.5)
			launch_projectile(obj_enemy_red_shot_massive, bsm.state.fireAngle - 15, 0.5)
		}
		
		if (bsm.stateAge > bsm.stateAgeMax) {
			bsm.state.transition(genericBossStates.chasing)
		}
	}
)

stateDying = bsm_create_state_dying()

bsm.addState(stateInit)
bsm.addState(stateChasing)
bsm.addState(stateMegaOrb)
bsm.addState(stateDying, bsmStateTypes.dying)

bsm.setInitialState(genericBossStates.init)