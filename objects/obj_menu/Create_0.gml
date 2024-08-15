/// @description Init

enum menuWidths {
	basic = 160,
	talents = 320
}

age = 0

title = ""

parentMenu = noone

centeredX = true
centeredY = true
menuWidth = 160
menuHeight = 0
dynamicHeight = true
titleHeight = 40

paddingX = 10
paddingY = 0
paddingTop = 9

marginX = 0
marginY = 0

buttonMarginY = 4

display = true
focused = true
enabled = true

buttons = []		// array of obj_menu_botton

buttonPressed = false

selectedButtonIndex = 0

scaleX = menuWidth / sprite_width
scaleY = menuHeight / sprite_height

hide = function() {
	for (var i = 0; i < array_length(buttons); i++) {
		buttons[i].display = false
		focused = false
	}
	
	display = false
}

show = function() {
	for (var i = 0; i < array_length(buttons); i++) {
		buttons[i].display = true
		focused = true
	}
	
	display = true
}

close = function() {
	for (var i = 0; i < array_length(buttons); i++) {
		instance_destroy(buttons[i])
	}
	
	buttons = []
	
	if (parentMenu != noone) {
		parentMenu.show()
	}
	
	if (instance_number(obj_menu) == 1) {
		set_game_pause_state(false)
	}
	
	instance_destroy()
}

addButtons = function() {
	var _btn
	var _btns = buttons
	
	buttons = []
	
	for (var i = 0; i < array_length(_btns); i++) {
		_btn = instance_create_depth(0, 0, depths.ui, _btns[i])
		add_button_to_menu(id, _btn)
	}
}
