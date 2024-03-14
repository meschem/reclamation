///@description   Kills all baddies in the room. Does not kill enemies outside of the room bounds.
function kill_all_baddies_in_room() {
	with (obj_baddie) {
		if (
			x > 0 &&
			y > 0 &&
			x < room_width &&
			y < room_height
			
		) {
			instance_destroy()
		}
	}
}