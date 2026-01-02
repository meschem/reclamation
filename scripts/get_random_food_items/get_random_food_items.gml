///@description						Gets a random food item. Results improved by luck/MF.
///@param {real} _count				Amount of items to get
///@param {id.Instance} _player		Player to get it for
///@return {array<id.Instance>}
function get_random_food_items(_count, _player) {
	var _luck = get_player_stat(enumPlayerStats.magicFind, _player) + 1
	var _weightNormal = 1
	var _weightRare = 0.25 * _luck
	var _weightVeryRare = 0.1 * (_luck * 1.2)
	var _weightLegendary = 0.05 * (_luck * 1.5)
	var _returnedFoods = []
	
	var _foods = [
		{
			inst: obj_pickup_str_1,
			weight: _weightNormal
		},
		{
			inst: obj_pickup_str_2,
			weight: _weightRare
		},
		{
			inst: obj_pickup_str_3,
			weight: _weightVeryRare
		},
				{
			inst: obj_pickup_dex_1,
			weight: _weightNormal
		},
		{
			inst: obj_pickup_dex_2,
			weight: _weightRare
		},
		{
			inst: obj_pickup_dex_3,
			weight: _weightVeryRare
		},
				{
			inst: obj_pickup_int_1,
			weight: _weightNormal
		},
		{
			inst: obj_pickup_int_2,
			weight: _weightRare
		},
		{
			inst: obj_pickup_int_3,
			weight: _weightVeryRare
		},
				{
			inst: obj_pickup_dex_int_1,
			weight: _weightRare
		},
		{
			inst: obj_pickup_dex_int_2,
			weight: _weightVeryRare
		},
		{
			inst: obj_pickup_str_int_1,
			weight: _weightRare
		},
		{
			inst: obj_pickup_str_int_2,
			weight: _weightVeryRare
		},
				{
			inst: obj_pickup_str_dex_1,
			weight: _weightRare
		},
		{
			inst: obj_pickup_str_dex_2,
			weight: _weightVeryRare
		},
	]
	
	_count = min(_count, array_length(_foods))
	
	for (var i = 0; i < _count; i++) {
		var _index = array_get_weighted_random(_foods)
		var _food = create_instance(_foods[_index].inst)
		
		array_delete(_foods, _index, 1)
		
		array_push(_returnedFoods, _food)
	}
	
	return _returnedFoods
}
