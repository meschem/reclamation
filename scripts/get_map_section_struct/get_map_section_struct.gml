///@description				Gets a map section based
///@param {real} _section	Section to get
///@return {struct}
function get_map_section_struct(_section) {
	var _sectionStruct
	
	if (instance_number(obj_map_controller) == 0) {
		show_message("No map controller found")
	}
	
	with (obj_map_controller) {
		_sectionStruct = getMapSection(_section)
		
		return _sectionStruct
	}
}