///@description					Returns a random baddie in a range. Returns noone if none is there.
///@param {real} _range			Range to find an enemy in.
///@return {Id.Instance}
function get_random_baddie_in_area(_range, _locX, _locY) {
	var baddieList = ds_list_create()
	var baddies = collision_circle_list(
		_locX, _locY,
		_range,
		obj_baddie,
		false,
		true,
		baddieList,
		false
	)
		
	if (baddies = 0) {
		return noone
	}
	
	ds_list_shuffle(baddieList)
			
	return baddieList[| 0]
}