/// @description Init

// Inherit the parent event
event_inherited();

title = "Select Profile"
subTitle = ""
buttons = [

]

var _button = noone
var _profile = noone

for (var i = 0; i < array_length(obj_profile_controller.profiles); i++) {
	_button = instance_create_depth(-999, -999, depths.ui, obj_menu_button_load_profile)
	_button.displayText = obj_profile_controller.profiles[i].name
	_button.profile = obj_profile_controller.profiles[i]
	_button.menu = id
	
	array_push(buttons, _button)
}

_button = instance_create_depth(-999, -999, depths.ui, obj_menu_button_back)
_button.menu = id

array_push(buttons, _button)
