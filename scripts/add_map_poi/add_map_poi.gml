///@description							Adds a poi for the map
///@param {id.Instance} _refInstance	Instance to add a POI for
///@param {asset.GMSprite} _mapIcon     Icon to use on the map
function add_map_poi(_refInstance = id, _mapIcon = spr_poi_generic) {
    var _poi = new mapPoi(_refInstance, _mapIcon)
	
	with (obj_map) {
		array_push(pois, _poi)
	}
}

///@description							Adds a poi for the map
///@param {id.Instance} _refInstance	Instance to remove a POI for
function remove_map_poi(_refInstance = id) {
    with (obj_map) {
        removePoi(_refInstance)
    }
}
