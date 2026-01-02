///@description					Returns a random baddie in a range. Returns noone if none is there.
///@param {real} _range			Range to find an enemy in.
///@param {real} _locX          Location X
///@param {real} _locY          Location Y
///@return {Id.Instance}
function get_random_baddie_in_area(_range, _locX, _locY, _count = 1) {
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

///@description					Returns a random baddie in a range. Returns noone if none is there.
///@param {real} _range			Range to find an enemy in.
///@param {real} _locX          Location X
///@param {real} _locY          Location Y
///@param {real} _count         Amount of units to get
function get_random_baddies_in_area(_range, _locX, _locY, _count = 1) {
    var _baddieList = ds_list_create()
	var _baddies = collision_circle_list(
		_locX, _locY,
		_range,
		obj_baddie,
		false,
		true,
		_baddieList,
		false
	)
    
    _count = min(_count, ds_list_size(_baddieList))
    
    var _returnBaddies = []
    
	ds_list_shuffle(_baddieList)
     
    for (var i = 0; i < _count; i++) {
        array_push(_returnBaddies, _baddieList[| i])
    }
			
	return _returnBaddies 
}
