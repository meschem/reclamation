enum buttonFocusTypes {
	keyboard,
	mouse,
	controller,
	none
}

title = "Unnamed"

menuWidth = view_width() - (x * 2)
menuHeight = 224

headerHeight = 44
bodyHeight = 166
paddingTop = 4
paddingBottom = 14
paddingX = 26
paddingY = 2

display = true
focused = true

buttonPressed = false

selectedButtonIndex = 0

scaleX = menuWidth / sprite_width
scaleY = menuHeight / sprite_height

buttons = []

useMouseFocus = true

close = function() {
	instance_destroy()
}