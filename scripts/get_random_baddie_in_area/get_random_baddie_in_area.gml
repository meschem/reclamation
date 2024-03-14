///@description					Returns a random baddie in a range. Returns noone if none is there.
///@param {real} _range			Range to find an enemy in.
///@return {Id.Instance}
function get_random_baddie_in_area(_range) {
	var target
	var baddieList = ds_list_create()
	var baddies = collision_circle_list(
		x, y,
		_range,
		obj_baddie,
		false,
		true,
		baddieList,
		false
	)
	
	ds_list_shuffle(baddies)
		
	for (var i = 0; i < ds_list_size(baddieList); i++) {
		//if (!array_contains(hitList, baddieList[| i])) {
		return baddieList[i]
			//break
		//}
	}
	
	return noone
}