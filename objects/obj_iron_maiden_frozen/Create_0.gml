/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

name = "Iron Maiden Laser"

hpMax = baddie_hp_massive
hp = hpMax

shadowSprite = spr_shadow_xxl
floatRange = 2

weight = baddie_weight_massive

pushRadius = 20
pushForce = 14

flies = true
collidesWith = baddie_collision_flier
hpBarDisplay = entityHpBarTypes.small

setup_move_charge_to_stop()

moveAccel = 0.25
moveDeaccel = 0.25
moveSpeedMax = 2

stateAge = 0

enum ironMaidenStates {
	normal,
	raging,
	enraged
}

ironMaidenState = ironMaidenStates.normal

//moveState = enemyMoveStates.stopped
//movePoint = new vec2()
//moveStateStoppedDuration = stf(1)
//moveStateAge = 0
//moveStateAngle = 0
//moveStateDistance = 0

beginStep = function() {
	stateAge++
	
	if (ironMaidenState == ironMaidenStates.normal) {
		if (hp < (hpMax * 0.99)) {
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
			sprite_index = spr_iron_maiden_frozen_opening
			ironMaidenState = ironMaidenStates.enraged
			
			for (var i = 0; i < 4; i++) {
				var _proj = instance_create_depth(x, y, depth - 1, obj_enemy_laser_blue)
				_proj.image_angle = i * 90
				_proj.laserRotationRate = 0.5
				_proj.lifeSpan = -1
				_proj.duration = -1
				_proj.owner = id
			}
		}
		
		return 0
	}
	
	if (ironMaidenState == ironMaidenStates.enraged) {
		
	}
}

