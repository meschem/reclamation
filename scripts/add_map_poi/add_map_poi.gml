///@description							Adds a poi for the map
///@param {id.Instance} _refInstance	Instance to add a POI for
function add_map_poi(_refInstance = id) {
	if (!variable_instance_exists(_refInstance, "mapIcon")) {
		create_toaster("Generic map POI generated", errorLevels.warning)
		_refInstance.mapIcon = spr_poi_generic
	}
	
	with (obj_map) {
		array_push(pois, _refInstance)
	}
}