/// @description Init

enum mapDrawStyles {
	none,
	small,
	large
}

drawStyle = mapDrawStyles.small

sprite_index = spr_minimap_plains_east
image_alpha = 0.66

pois = []
poiDrawInfo = []
poisToDelete = []

drawLocation = new vec2(2, 245)

///@description                     Removes a POI for an instance number
///@param {id.Instance} _inst       Instance to remove POI for
removePoi = function(_inst) {
    var _deleted = false
    
    for (var i = 0; i < array_length(pois); i++) {
        if (pois[i].instance == _inst) {
            array_delete(pois, i, 1)
            _deleted = true
            break
        }
    }
    
    //if (!_deleted) {
        //create_toaster("POI NOT FOUND")
    //} else {
        //create_toaster("POI REMOVED")
    //}
}
