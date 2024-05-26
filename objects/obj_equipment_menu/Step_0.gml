
//array_foreach(buttons, function(button, i) {
//	button.x = padding * (i + 1)
//})

if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_start)) {
	close()
}

if (keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0, gp_padd)) {
	selectedButton++
}

if (keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_padu)) {
	selectedButton--
}

selectedButton = clamp(
	selectedButton,
	0,
	array_length(buttons) - 1
)

for (var i = 0; i < array_length(panels); i++) {
	panels[i].x = x + padding + panels[i].offsetX
	panels[i].y = y + padding + panels[i].offsetY
	
	panels[i].width = width - (2 * padding)
}

for (var i = 0; i < array_length(buttons); i++) {
	if (selectedButton == i) {
		buttons[i].state = buttonStates.selected
	} else {
		buttons[i].state = buttonStates.normal
	}	
}