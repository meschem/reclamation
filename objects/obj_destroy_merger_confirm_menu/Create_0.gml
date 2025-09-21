/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

depth = -9999

title = "Destroy Item?"
subTitle = "This will provide breakdown rewards of (5) Gold"
centered = true
buttons = []

destroySlotIndex = -1
backpackOwner = noone

fontType = font_alagard
	
var _buttons = [
	obj_menu_button_confirm_merge_destroy,
	obj_menu_button_merge_destroy_no
]

var _button

for (var i = 0; i < array_length(_buttons); i++) {
	_button = instance_create_depth(-999, -999, depths.ui, _buttons[i])
	array_push(buttons, _button)
	_button.menu = id
}
