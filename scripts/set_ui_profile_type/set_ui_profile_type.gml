///@description							Controls what type of element is focused by the UI
///@param {real} _profileType			Focus type to set, uses enum uiProfileTypes
function set_ui_profile_type(_profileType) {
	with (obj_ui_controller) {
		setUiProfileType(_profileType)
	}
}


///@description							Gets what type of element is focused by the UI
///@return {real}						Returns an enum uiProfileTypes
function get_ui_profile_type() {
	var _type = -1
	
	with (obj_ui_controller) {
		_type = uiProfileType
	}
	
	return _type
}
