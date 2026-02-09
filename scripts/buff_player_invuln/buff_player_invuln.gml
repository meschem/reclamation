///@description					Makes the player invulnerable for a period of time
///@param {real} seconds		Amount of time to be invuln in frames
///@return {id.Instance}
function buff_player_invuln(seconds) {
	var replaced = false
	
	with (obj_buff_invuln) {
		if (timer <= seconds) {
			instance_destroy()
		} else {
			replaced = true
		}
	}
	
	if (!replaced) {
		var inst = instance_create_depth(0, 0, depths.fx, obj_buff_invuln)
		inst.timer = seconds_to_frames(seconds)
		
		return inst
	}

	return noone
}
