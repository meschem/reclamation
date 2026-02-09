// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bsm_func_dying_create(_stateAgeMax = 224) {
	global.funcTemp =_stateAgeMax
	var _func = function() {
		xVel = 0
		yVel = 0
		moveBehavior = entityMoveBehaviors.none
		isDying = true
		stateAgeMax = global.funcTemp - 1
		dropCdMax = (global.funcTemp) / (array_length(dyingDrops) + 1)
		dropCd = 0
	}
	
	return _func
}

function bsm_func_dying_step() {
	var _func = function() {
		dropCd++

		if (dropCd >= dropCdMax && array_length(dyingDrops) > 0) {
			create_pickup_with_lob(dyingDrops[0], x, y, get_color(colors.red))
			array_delete(dyingDrops, 0, 1)
			dropCd = 0
		}
			
		if (bsm.stateAge % 14 == 0) {
			var _boom = instance_create_depth(
				x + irandom_range(-20, 20),
				y + irandom_range(-20, 20),
				depth - 100,
				obj_particle_single_cycle
			)
			
			_boom.sprite_index = explosionSprite
		
			audio_play_sound(snd_fireball_impact_short, 0, false)
		
			spawn_fx_bouncers(
				array_random(deathParticles),
				random(360),
				random_range(0.6, 1.2)
			)
		}
		
		if (bsm.stateAge > stateAgeMax) {
			var _boom = instance_create_depth(x, y, depth - 110, obj_particle_single_cycle)
			_boom.sprite_index = explosionSprite
			_boom.image_xscale = 2
			_boom.image_yscale = 2
		
			audio_play_sound(snd_fireball_impact_crunchy_echo, 0, false)
			
			instance_destroy()
		}
	}
	
	return _func
}