// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function process_equipment_stats(_equipment = id){
	_equipment.statsProcessed = true
	
	// Standard Stats
	for (var i = 0; i < array_length(obj_game_controller.itemStatTypes); i++) {
		var _statType = obj_game_controller.itemStatTypes[i]
		var _bonusVar = _statType.bonusVar
		var _value = variable_instance_get(_equipment, _bonusVar)
		var _name = _statType.displayName
		var _itemStatEnum = i
		var _set = false
		
		if (is_array(_value)) {
            if (array_length(_value) > 0) {
                //show_message("ARRAY")
                //show_message(_value)
                array_push(_equipment.stats, new itemStat(_itemStatEnum, _value))
                _set = true
            }	
		} else if (_value != 0 && _value != undefined) {
			//show_message("NORMAL")
			//show_message(_value)
			array_push(_equipment.stats, new itemStat(_itemStatEnum, _value))
			_set = true
		}
		
		//if (_set) {
		//	create_toaster($"Stat block set for {_equipment.name}")
		//}
	}
	
	// Custom Stats
	for (var i = 0; i < array_length(_equipment.statsSpecial); i++) {
		// build custom strings
	}
}