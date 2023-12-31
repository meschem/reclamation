/// @description Init

event_inherited()

x = 124
y = 76

menuWidth = view_width() - (x * 2)
menuHeight = 224

headerHeight = 44
bodyHeight = 166
paddingTop = 4
paddingBottom = 14
paddingX = 26
paddingY = 2
buttonCount = 3

buttonSpacing = 120

scaleX = menuWidth / sprite_width
scaleY = menuHeight / sprite_height

buttonFocusIndex = -1

center = function() {
	x = (view_width() - menuWidth) / 2
	y = (view_height() - menuHeight) / 2
}
