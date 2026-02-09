/// @description Insert description here
// You can write your code in this editor

age++

if (age >= ageMax) {
	instance_destroy()
	
	return 0
}

/// adjust banner
var _remaining = view_width() - bannerWidth

if (_remaining > 5) {
	bannerWidth += (_remaining + 5) * 0.1
} else {
	bannerWidth = view_width()
}

bannerDrawInfo = {
	x1: view_width() - bannerWidth,
	y1: view_height() - bannerPadding - bannerBorderWidth - bannerHeight,
	x2: view_width,
	y2: view_height() - bannerPadding - bannerBorderWidth
}
