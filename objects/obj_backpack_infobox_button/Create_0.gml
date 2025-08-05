///@description		Setup

image_alpha = 1

width = 0
height = 0

inputText = "Unset"

icon = spr_btn_xbox_a
iconOffset = new vec2(4, 4)

iconFont = font_aseprite
iconSwap = spr_btn_xbox_y
iconCombine = spr_btn_xbox_x
iconDrop = spr_btn_xbox_b
iconTextOffset = new vec2(4 + 17, 4)

infobox = noone

padding = {
	top: 4,
	right: 6,
	bottom: 4,
	left: 6
}

setInput = function(_icon, _text) {
	icon = _icon
	inputText = _text
	
	draw_set_font(font_aseprite)
	
	width = string_width(inputText) + sprite_get_width(icon) + padding.left + padding.right
	height = sprite_get_height(icon) + padding.top + padding.bottom
	
	image_xscale = width / sprite_get_width(spr_backpack_input_indicator)
	image_yscale = height / sprite_get_height(spr_backpack_input_indicator)
}
