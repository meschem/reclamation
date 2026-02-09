
image_index = state

offsetY = (state == buttonStates.clicked) ? 2 : 0

if (!enabled) {
	state = buttonStates.disabled
	image_index = 3
}

if (menu != noone) {
	depth = menu.depth - 1
	display = menu.display
}
