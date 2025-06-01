///@description   Description
function process_map_events() {
	var _eventLocations = []

	with (obj_event_location) {
		array_push(_eventLocations, id)
	}

	var _maxEvents = min(4, array_length(_eventLocations))

	_eventLocations = array_shuffle(_eventLocations)

	for (var i = 0; i < _maxEvents; i++) {
		var _event = instance_create_depth(
			_eventLocations[i].x, 
			_eventLocations[i].y,
			0,
			obj_elite_obelisk
		)
	
		add_map_poi(_event)
	}
	
	with (obj_event_location) {
		instance_destroy()
	}
}
