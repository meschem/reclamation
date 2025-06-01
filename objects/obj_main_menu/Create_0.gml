/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

title = "Game Paused"
subTitle = ""
centered = true
buttons = []
	
var _buttons = [
	obj_menu_button_options,
	obj_menu_button_view_equipment,
	obj_menu_button_resume_game,
	obj_menu_button_restart_run,
	obj_menu_button_end_run
]

var _button

for (var i = 0; i < array_length(_buttons); i++) {
	_button = instance_create_depth(-999, -999, depths.ui, _buttons[i])
	array_push(buttons, _button)
	_button.menu = id
}
