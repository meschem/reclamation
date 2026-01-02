///@description					Cleans up map events on reloading a map
function cleanup_map_events() {
	with (obj_event_location) {
		instance_destroy()
	}
    
    with (obj_merger_item_chest) {
        instance_destroy()
    }
    
    with (obj_merger_item_chest_locked) {
        instance_destroy()
    }
	
	with (obj_elite_obelisk) {
		add_map_poi(id, mapIcon)
	}
	
	with (obj_room_exit) {
		add_map_poi(id, mapIcon)
	}
	
	with (obj_merchant_merger_zone) {
		add_map_poi(id, mapIcon)
	}
}
