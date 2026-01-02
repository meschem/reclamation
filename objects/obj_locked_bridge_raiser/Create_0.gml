///@description		Init

event_inherited()

depth = depths.player - y

maxRange = 500

onCollision = function(_player) {
	if (array_contains(_player.keys, obj_key_royal)) {
		audio_play_sound(snd_unlock_door, 0, false)
        
        with (obj_hidden_water_bridge_lowered) {
            if (point_distance(other.x, other.y, x, y) < other.maxRange) {
                instance_create_depth(x, y, depths.enemyFloorFx, obj_hidden_water_bridge_raised)
                instance_destroy()
            }
            
        }
        
		instance_destroy()
	}
}
