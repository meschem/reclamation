///@description   Description
function process_map_events() {
	var _eventLocations = []
	var _events = []
		
	var _eventObjects = [
		obj_elite_obelisk,
		obj_swarm_obelisk,
		obj_infernal_obelisk,
	]

	with (obj_event_location) {
		if (get_map_object_used(id)) {
			instance_destroy()
		} else {
			set_map_object_to_used(id)
			array_push(_eventLocations, id)
		}
	}

	var _maxEvents = min(6, array_length(_eventLocations))

	_eventLocations = array_shuffle(_eventLocations)

	for (var i = 0; i < _maxEvents; i++) {
		var _event = instance_create_depth(
			_eventLocations[i].x, 
			_eventLocations[i].y,
			0,
			array_random(_eventObjects)
		)
		
		_event.persistent = true
		
		add_map_poi(_event)
	}
	
	with (obj_event_location) {
		instance_destroy()
	}
}
