///@description					Cleans up map events on reloading a map
function cleanup_map_events() {
	with (obj_event_location) {
		instance_destroy()
	}
}
