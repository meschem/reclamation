/// @description Setup

persistent = true

ability = noone

titleFont = font_aseprite
descriptionFont = font_aseprite

titleText = ""
descriptionText = ""

stat = {}
isSetup = false

padding = {
	top: 5,
	left: 12,
	right: 12,
	bottom: 8
}

lineSpacing = -3
lineSpacingSm = -5

descriptionPaddingTop = 6

width = 0
height = 0

image_index = 6

///@description					Shows the infobox and its buttons
show = function() {
	image_alpha = 1
}

///@description					Hides the infobox and its buttons
hide = function() {
	image_alpha = 0
}

///@description					Setup the infobox with an item
///@param {struct} _stat		Stat to setup
updateStat = function(_stat) {
	isSetup = true
	stat = _stat.stat
	
	titleText = get_player_stat_name(stat)
	descriptionText = get_player_stat_description(stat)
	
	updateSize()
	updatePosition()
}

///@description					Sets window size based on selected item
updateSize = function() {
	width = 240
	height = padding.top + padding.bottom
	
	draw_set_font(titleFont)
	height += string_height(titleText) + lineSpacing
	
	height += descriptionPaddingTop

	draw_set_font(descriptionFont)
	height += string_height_ext(descriptionText, lineSpacingSm, width - padding.left - padding.right)
	
	height += padding.bottom
	
	image_xscale = width / sprite_get_width(spr_backpack_window_popup)
	image_yscale = height / sprite_get_height(spr_backpack_window_popup)
}

///@description					Updates X and Y draw coordinates, must be set after updateSize() to work
updatePosition = function() {
	var _offsetY = 0
	
	with (obj_player_stats_menu) {
		_offsetY = getStatUiOffsetY()
	}
	
	_offsetY = _offsetY + 5 - (height / 2)
	
	y = clamp(
		_offsetY,
		20,
		view_height() - height - 20
	)
	
	x = 181
}
