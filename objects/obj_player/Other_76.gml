if event_data[? "event_type"] == "sprite event" // or you can check "sprite event"
{
    switch (event_data[? "message"])
    {
        case "activateWarStomp":
			with (obj_ability_war_stomp_active) {
				if (other.id == owner) {
					activate_war_stomp_active(level)	
				}
			}
        break
    
        case "jonahWalkingLand":
			var _puff = instance_create_depth(x, y + 7, depths.playerAura, obj_particle_single_cycle)
            _puff.sprite_index = spr_smoke_puff_flat_sm
            _puff.xVel = random_range(-0.6, 0.6)
            _puff.yVel = random_range(-0.6, 0.6)
            
            audio_play_random_sound(
                [snd_step_gravel_01, snd_step_gravel_02, snd_step_gravel_03],
                2,
                false,
                random_range(0.25, 0.4),
                0,
                random_range(0.95, 1.05)
            )
        break
    }
}