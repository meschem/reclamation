/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

name = "Iron Maiden"

hpMax = baddie_hp_massive
hp = hpMax

shadowSprite = spr_shadow_xxl
floatRange = 2

weight = baddie_weight_massive
xp = baddie_xp_brutal_plus

pushRadius = 20
pushForce = 14

enragedAttackRate = stf(3)
enragedHpRatio = 0.3

flies = true
collidesWith = baddie_collision_flier
hpBarDisplay = entityHpBarTypes.small

setup_move_charge_to_stop()

moveAccel = 0.25
moveDeaccel = 0.25
moveSpeedMax = 2

stateAge = 0

ironMaidenState = ironMaidenStates.normal

deathParticles = [
	obj_ptb_maiden_crown,
	obj_ptb_maiden_door_chunk,
	obj_ptb_maiden_door_chunk,
	obj_ptb_maiden_door_chunk,
	obj_ptb_maiden_door_chunk,
	obj_ptb_maiden_door_chunk,
]

deathParticleSpawnRange.x = 10
deathParticleSpawnRange.y = 20

//moveState = enemyMoveStates.stopped
//movePoint = new vec2()
//moveStateStoppedDuration = stf(1)
//moveStateAge = 0
//moveStateAngle = 0
//moveStateDistance = 0

beginStep = function() {
	stateAge++
	
	if (ironMaidenState == ironMaidenStates.normal) {
		if (hp < (hpMax * enragedHpRatio)) {
			stateAge = 0
			moveBehavior = entityMoveBehaviors.none
			weight = baddie_weight_immovable
			ironMaidenState = ironMaidenStates.raging
		}
		
		return 0
	}
	
	if (ironMaidenState == ironMaidenStates.raging) {
		deaccelerate(moveDeaccel)
		
		if (stateAge >= stf(1)) {
			stateAge = 0
			sprite_index = spr_iron_maiden_opening
			ironMaidenState = ironMaidenStates.enraged
		}
		
		return 0
	}
	
	if (ironMaidenState == ironMaidenStates.enraged) {
		if (stateAge % enragedAttackRate == 0) {
			repeat (7) {
				launch_projectile(obj_enemy_red_shot, random(360), random_range(0.5, 1.5))
			}
		}
	}
}

