/// @description Init

enum menuWidths {
	basic = 160,
	talents = 320
}

title = ""

centeredX = true
centeredY = true
menuWidth = 160
menuHeight = 0
dynamicHeight = true
titleHeight = 60

paddingX = 10
paddingY = 4

marginX = 0
marginY = 0

buttonMarginY = 6

display = false
focused = true

buttons = [
	"Start",
	"Options",
	"Quit"
]

buttonPressed = false

selectedButtonIndex = 0

scaleX = menuWidth / sprite_width
scaleY = menuHeight / sprite_height
