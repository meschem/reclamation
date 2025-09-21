///@description					Cleans up map events on reloading a map
function cleanup_map_events() {
	with (obj_event_location) {
		instance_destroy()
	}
	
	with (obj_elite_obelisk) {
		add_map_poi()
	}
	
	with (obj_room_exit) {
		add_map_poi()
	}
	
	with (obj_merchant_merger_zone) {
		add_map_poi()
	}
}
