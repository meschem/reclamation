///@description							Controls what type of element is focused by the UI
///@param {real} _focusType				Focus type to set, uses enum uiFocusTypes
function set_ui_focus_type(_focusType) {
	with (obj_ui_controller) {
		setUiFocusType(_focusType)
	}
}


///@description							Gets what type of element is focused by the UI
///@return {real}						Returns an enum uiFocusTypes
function get_ui_focus_type() {
	var _type = -1
	
	with (obj_ui_controller) {
		_type = focusType
	}
	
	return _type
}
