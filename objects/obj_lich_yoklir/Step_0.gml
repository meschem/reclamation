
// Inherit the parent event
event_inherited()

if (game_is_paused()) {
	return 0
}

stateAge++

if (damageStage == 0 && hp / hpMax < 0.66) {
	damageStage = 1
} else if (damageStage == 1 && hp / hpMax < 0.33) {
	damageStage = 2
}

if (hp <= 0 && lichState != lichBossStates.dying) {
	xVel = 0
	yVel = 0
	
	stateDying()
}

if (lichState == lichBossStates.init) {
	stateInit()
}

else if (lichState == lichBossStates.chasing) {
	if (stateAge >= stateAgeMax) {
		moveBehavior = entityMoveBehaviors.none
		
		stateAttackToIdle()
	}
	
	if (iceBlastSwarmCd > 0) {
		iceBlastSwarmCd--
	} else {
		if (iceBlastSwarmFiringCd > 0) {
			if (iceBlastSwarmFiringCd % iceBlastSwarmFireRate == 0) {
				var angle = irandom(360)
				var mag = 30
				var vector = get_vector_from_angle_mag(angle, mag)
				
				delayed_ice_blast(x + vector[0], y + vector[1])
			}
			
			iceBlastSwarmFiringCd--
		} else {
			iceBlastSwarmFiringCd = iceBlastSwarmFiringCdMax
			iceBlastSwarmCd = iceBlastSwarmCdMax
		}
	}
}

else if (lichState == lichBossStates.idle) {
	stateAge++
	
	deaccelerate(0.05)
	
	if (stateAge > stateAgeMax) {
		idleRandomAttackState()
	}
}

else if (lichState == lichBossStates.reposition) {
	var _remaining = point_distance(x, y, targetLocation.x, targetLocation.y)
	
	if (_remaining <= 4) {
		stateRepositionToQueuedAttack()
	} else if (_remaining < targetStopDistanceCushion) {
		var _mag = deaccelerate(0.05)
		
		if (_mag <= 0.01) {
			stateRepositionToQueuedAttack()
		}
	} else {
		var _angle = point_direction(x, y, targetLocation.x, targetLocation.y)
		var _mag = point_distance(0, 0, xVel, yVel)	
	
		_mag = min(_mag + accel, moveSpeedMax)
	
		//set_velocity_from_angle(id, _angle, _mag)
		
		try {
			xVel = cos(degtorad(_angle)) * _mag
			yVel = sin(degtorad(_angle)) * -_mag
		} catch (err) {
			show_message(err)
		}
	}
}

else if (lichState == lichBossStates.frostBeams) {
	if (stateAge == 60) {
		for (var i = 0; i < frostBeamsLaserCount; i++) {
			var _laser = instance_create_depth(x, y, depth + 10, obj_enemy_laser_blue)
			
			_laser.duration = stf(8)
			_laser.laserRotationRate = 0.4
			_laser.image_angle = i * (360 / frostBeamsLaserCount)
		}
	}
	
	if (stateAge % 40 == 0 && hp < hpMax * frostBeamsUberHpRatio) {
		for (var i = 0; i < frostBeamsFlakeCount; i++) {
			var _proj = instance_create_depth(-99, -99, depths.enemyProjectile, obj_enemy_orbital_ice_shot)
			_proj.revolutionRate = -1
			_proj.parent = id
			_proj.angleFromParent = i * (360 / frostBeamsFlakeCount)
			//launch_projectile(
			//	obj_enemy_blue_shot,
			//	i * (360 / frostBeamsFlakeCount) - (stateMod * 12),
			//	1.4
			//)
		}
		
		stateMod++
	}
	
	if (stateAge >= stateAgeMax) {
		with (obj_enemy_laser_blue) {
			instance_destroy()
		}
		
		stateAttackToIdle()
	}
}

else if (lichState == lichBossStates.iceStorm) {
	if (stateAge % 120 == 0) {
		launch_projectile(obj_enemy_lich_piercing_turret, 225, 1.7)
		launch_projectile(obj_enemy_lich_piercing_turret, 315, 1.7)
	}
	
	if (stateAge >= stateAgeMax) {
		stateAttackToIdle()
	}
} 

else if (lichState == lichBossStates.dying) {
	if (stateAge > stf(5)) {
		var _boom = instance_create_depth(x, y, depth - 110, obj_particle_single_cycle)
		_boom.sprite_index = spr_blue_explosion
		_boom.image_xscale = 2
		_boom.image_yscale = 2
		
		audio_play_sound(snd_fireball_impact_crunchy_echo, 0, false)
		
		for (var i = 0; i < 12; i++) {
			spawn_fx_bouncers(dyingParticles, random(360), random_range(0.6, 2))
		}
		
		spawn_fx_bouncers(deathParticles, random(360), random_range(0.6, 2))
		
		instance_destroy()
	}
		
	else if (stateAge % 14 == 0) {
		var _boom = instance_create_depth(
			x + irandom_range(-20, 20),
			y + irandom_range(-20, 20),
			depth - 100,
			obj_particle_single_cycle
		)
			
		_boom.sprite_index = spr_blue_explosion
		
		audio_play_sound(snd_fireball_impact_short, 0, false)
		
		spawn_fx_bouncers(
			dyingParticles,
			random(360),
			random_range(0.6, 1.2)
		)
	}
}