///@description   Description
function run_banshee_queen_step() {
	stateAge++
	
	var _hpRatio = hp / hpMax
	
	if (_hpRatio > 0.6) {
		image_index = 0
	} else if (_hpRatio > 0.2) {
		image_index = 1
	} else if (_hpRatio > 0) {
		image_index = 2
	}
	
	if (hp <= 0 && bansheeState != bansheeQueenStates.dying) {
		stateDying()
	}
	
	if (bansheeState == bansheeQueenStates.idle) {
		if (stateAge > stf(8)) {
			if (random(1) < 0.6) {
				stateIdleToCastingChaosOrbs()
			} else {
				stateIdleToCastingLasers()
			}
			
			return 0
		}
	}
	
	else if (bansheeState == bansheeQueenStates.castingChaosOrbs) {
		if (stateAge > stf(3)) {
			stateCastingChaosOrbsToIdle()
			
			return 0
		}
	}
	
	else if (bansheeState == bansheeQueenStates.castingLasers) {
		if (stateAge > stf(2)) {
			stateCastingLasersToRecovery()
			
			return 0
		}
	}
	
	else if (bansheeState == bansheeQueenStates.laserRecovery) {
		if (stateAge > stf(6)) {
			stateLaserRecoveryToIdle()
		}
	}
	
	else if (bansheeState == bansheeQueenStates.dying) {
		if (stateAge > stf(5)) {
			instance_destroy()
		}
		
		else if (stateAge % 9 == 0) {
			var _boom = instance_create_depth(
				x + irandom_range(-60, 60),
				y + irandom_range(-60, 60),
				depth - 100,
				obj_particle_single_cycle
			)
			
			_boom.sprite_index = spr_orange_explosion
		}
	}
}
