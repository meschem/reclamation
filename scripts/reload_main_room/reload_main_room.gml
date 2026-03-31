function reload_main_room() {
	with (obj_event_location) {
		instance_destroy()
	}

	with (obj_obelisk) {
        instance_destroy(id, false)
	}
    
    with (obj_destructible) {
        instance_destroy(id, false)
    }
	
	with (obj_room_exit) {
		add_map_poi(id, mapIcon)
	}
	
	with (obj_merchant_merger_zone) {
		add_map_poi(id, mapIcon)
	}
    
    with (obj_waypoint) {
        add_map_poi(id, mapIcon)
    }
    
    reactivate_waypoints()
}
