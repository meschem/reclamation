///@description         Sets up POIs for map load. This should be the only thing adding POIs for most map objects. This should only apply to non-persistent objects.
function setup_map_pois() {
    var _objs = obj_room_controller.initialMapPoiObjects
    for (var i = 0; i < array_length(_objs); i++) {
    	with (_objs[i]) {
            add_map_poi(id, mapIcon)
        }
    }
}
