///@description									Sets up a basic init state where the AI is idle for X seconds
///@param {real} _stateEnum						Initial state enum. Uses your bossStates enum
///@param {real} _stateAgeMax
///@param {asset.GMSprite} _explosionSprite		Explosion sprite to use
///@param {bool} _endCombat						Ends combat. Common for arena bosses.
function bsm_create_state_dying(_stateEnum = genericBossStates.dying, _stateAgeMax = 224, _explosionSprite = spr_orange_explosion, _endCombat = false) {
	var _create = bsm_func_dying_create(_stateAgeMax)
	var _step = bsm_func_dying_step()
	
	return new bsmState(
		_stateEnum,
		_create,
		_step
	//	function(_sprite = spr_orange_explosion) {
	//		if (bsm.stateAge % 14 == 0) {
	//			var _boom = instance_create_depth(
	//				x + irandom_range(-20, 20),
	//				y + irandom_range(-20, 20),
	//				depth - 100,
	//				obj_particle_single_cycle
	//			)
			
	//			_boom.sprite_index = _sprite
		
	//			audio_play_sound(snd_fireball_impact_short, 0, false)
		
	//			spawn_fx_bouncers(
	//				array_random(deathParticles),
	//				random(360),
	//				random_range(0.6, 1.2)
	//			)
	//		}
		
	//		if (bsm.stateAge > 14 * 16 - 1) {
	//			var _boom = instance_create_depth(x, y, depth - 110, obj_particle_single_cycle)
	//			_boom.sprite_index = _sprite
	//			_boom.image_xscale = 2
	//			_boom.image_yscale = 2
		
	//			audio_play_sound(snd_fireball_impact_crunchy_echo, 0, false)
			
	//			instance_destroy()
	//		}
	//	}
	)
}
