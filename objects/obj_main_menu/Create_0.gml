/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

title = ""
subTitle = ""
centered = true
buttons = []
canClose = false
	
var _buttons = [
	obj_menu_button_load_last_save,
	obj_menu_button_show_profiles,
	obj_menu_button_exit_game
]

var _button

for (var i = 0; i < array_length(_buttons); i++) {
	_button = instance_create_depth(-999, -999, depths.ui, _buttons[i])
	array_push(buttons, _button)
	_button.menu = id
}
