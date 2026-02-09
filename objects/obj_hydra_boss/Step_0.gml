
// Inherit the parent event
event_inherited()

if (game_is_paused()) {
	return 0
}

stateAge++

if (damageStage == 0 && hp / hpMax < 0.66) {
	damageStage = 1
	image_index = 1
	instance_create_depth(x - 5, y + 30, depths.enemy, obj_hydra_head_red)
} else if (damageStage == 1 && hp / hpMax < 0.33) {
	damageStage = 2
	image_index = 2
	instance_create_depth(x + 5, y + 30, depths.enemy, obj_hydra_head_red)
}

if (hp <= 0 && hydraState != hydraLordStates.dying) {
	xVel = 0
	yVel = 0
	
	stateDying()
}

if (hydraState == hydraLordStates.init) {
	stateInit()
}

else if (hydraState == hydraLordStates.idleMover) {
	if (stateAge >= stateAgeMax) {
		queueRandomAttack()
		
		stateIdleMoverToReposition()
	}
}

else if (hydraState == hydraLordStates.reposition) {
	var _remaining = point_distance(x, y, targetLocation.x, targetLocation.y)
	
	if (_remaining <= 4) {
		xVel = 0
		yVel = 0
		
		chooseAttackState()
	} else if (_remaining < targetStopDistanceCushion) {
		deaccelerate(-0.05)
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

else if (hydraState == hydraLordStates.spreadBlast) {
	if (stateAge > 45 && stateAge % 22 == 0) {
		var _fireAngle = 330 - (10 * stateMod)
		
		launch_projectile(obj_enemy_red_shot, _fireAngle - 40, 2.5)
		launch_projectile(obj_enemy_red_shot, _fireAngle, 2.5)
		launch_projectile(obj_enemy_red_shot, _fireAngle + 40, 2.5)
		
		audio_play_sound(snd_fireball_launch_fuzz, 0, false)
		
		stateMod++
	}
	
	if (stateMod >= 13) {
		stateAttackToIdle()
	}
}

else if (hydraState == hydraLordStates.chaosSpit) {
	var _angle = 0
	var _mag = 0
	var _angleOffset = 0
	var _targetOffset = new vec2()
	var _targetPoint = new vec2()
	var _proj = noone
	
	if (stateAge > 60 && stateAge % 10 == 0) {
		_angle = random(360)
		_mag = random_range(40, 250)
		_targetOffset = get_vec2_from_angle_mag(_angle, _mag)
	
		_proj = baddie_attack_lob_shot(
			multiLobProjectile,
			x + _targetOffset.x,
			y + _targetOffset.y,
			x + (8 * sign(image_xscale)),
			y,
			36
		)
		
		audio_play_sound(snd_fireball_launch_fuzz, 0, false)
	}
	
	if (stateAge > 240) {
		stateAttackToIdle()
	}
}

else if (hydraState == hydraLordStates.multiLob) {
	var _targetPoint = new vec2()
	var _targetOffset = new vec2()
	var _angleOffset = 0
	var _angle = 0
	var _mag = 0
	var _proj = noone
	var _fireRate = 45
	
	if (stateAge == 20 + (_fireRate * 1)) {
		targetLocation.x = target.x
		targetLocation.y = target.y
		
		baddie_attack_lob_shot(
			multiLobProjectile, 
			targetLocation.x, 
			targetLocation.y, 
			x + (8 * sign(image_xscale)), 
			y, 
			36
		)
		
		audio_play_sound(snd_fireball_launch_fuzz, 0, false)
	}
	
	if (stateAge == 20 + (_fireRate * 2)) {
		_angleOffset = 0
		_mag = 45
		
		for (var i = 0; i < 3; i++) {
			_angle = _angleOffset + (i * 120)
			_targetOffset = get_vec2_from_angle_mag(_angle, _mag)
			
			_targetPoint = add_vec2(
				targetLocation,
				_targetOffset
			)
			
			_proj = baddie_attack_lob_shot(
				multiLobProjectile,
				_targetPoint.x,
				_targetPoint.y,
				x + (8 * sign(image_xscale)),
				y,
				36
			)
			
			_proj.explodeProjectileAngleOffset = i * 120
		}
		
		audio_play_sound(snd_fireball_launch_fuzz, 0, false)
	}
	
	if (stateAge == 20 + (_fireRate * 3)) {
		_angleOffset = 60
		_mag = 90
		
		for (var i = 0; i < 3; i++) {
			_angle = _angleOffset + (i * 120)
			_targetPoint = add_vec2(
				targetLocation,
				get_vec2_from_angle_mag(_angle, _mag)
			)
			
			_proj = baddie_attack_lob_shot(
				multiLobProjectile,
				_targetPoint.x,
				_targetPoint.y,
				x + (8 * sign(image_xscale)),
				y,
				36
			)
			
			_proj.explodeProjectileAngleOffset = i * 120
		}
		
		audio_play_sound(snd_fireball_launch_fuzz, 0, false)
	}
	
	if (stateAge >= 200) {
		stateAttackToIdle()
	}
} else if (hydraState == hydraLordStates.dying) {
	if (stateAge > stf(5)) {
		var _boom = instance_create_depth(x, y, depth - 110, obj_particle_single_cycle)
		_boom.sprite_index = spr_orange_explosion
		_boom.image_xscale = 2
		_boom.image_yscale = 2
		
		audio_play_sound(snd_fireball_impact_crunchy_echo, 0, false)
		
		for (var i = 0; i < 16; i++) {
			spawn_fx_bouncers(deathParticles, random(360), random_range(0.6, 2))
		}
		
		instance_destroy()
	}
		
	else if (stateAge % 14 == 0) {
		var _boom = instance_create_depth(
			x + irandom_range(-20, 20),
			y + irandom_range(-20, 20),
			depth - 100,
			obj_particle_single_cycle
		)
			
		_boom.sprite_index = spr_orange_explosion
		
		audio_play_sound(snd_fireball_impact_short, 0, false)
		
		spawn_fx_bouncers(
			deathParticles,
			random(360),
			random_range(0.6, 1.2)
		)
	}
}