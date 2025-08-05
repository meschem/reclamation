//nextLevel = rm_start_dev
//finalLevel = true

category = roomCategories.combatSingle
setup_level_single_area_a()

var _inst = create_instance(obj_map)
_inst.sprite_index = spr_minimap_plains_east

//var _eventLocations = []

//with (obj_event_location) {
//	array_push(_eventLocations, id)
//}

//var _maxEvents = min(4, array_length(_eventLocations))

//_eventLocations = array_shuffle(_eventLocations)

//for (var i = 0; i < _maxEvents; i++) {
//	var _event = instance_create_depth(
//		_eventLocations[i].x, 
//		_eventLocations[i].y,
//		0,
//		obj_elite_obelisk
//	)
	
//	add_map_poi(_event)
//}

//create_toaster("DONE!")
