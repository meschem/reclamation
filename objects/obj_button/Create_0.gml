
///@description			Button

state = buttonStates.normal

width = 100
height = 60
paddingX = 4
paddingY = 4

player = get_player_target() //FIXME: MULTIPLAYER

image_xscale = width / sprite_width
image_yscale = height / sprite_height

image_speed = 0

menu = noone
textAlign = enumAligns.left
textString = ""
textPosition = new vec2(x + paddingX, y + paddingY)
textFont = font_pxlxxl_m

display = true

onClick = function () {
	show_message("On click behavior not set!")
}

///@description		Mouse is over button
///@return {bool}
mouseIsOver = function () {
	var camOffsetX = camera_get_view_x(view_camera[0])
	var camOffsetY = camera_get_view_y(view_camera[0])

	if (
		mouse_x > x + camOffsetX &&
		mouse_y > y + camOffsetY &&
		mouse_x < x + camOffsetX + width &&
		mouse_y < y + camOffsetY + height
	) {
		return true
	}
	
	return false
}

///@description				Updates text on button. Sets alignment
///@param {string} str		Text to set button to
///@param {real} align		enumAligns. Alignment to use
setText = function(str, align = enumAligns.center) {
	textString = str

	if (align == enumAligns.center) {
		draw_set_font(textFont)
		
		var textWidth = string_width(textString)
		var textHeight = string_height(textString)
		
		textPosition.x = (width / 2) - (textWidth / 2)
		textPosition.y = (height / 2) - (textHeight / 2)
	}	
}

///@description				Sets a button's height and width
///@param {real} _width		Width
///@param {real} _height	Height
setButtonSize = function(_width, _height) {
	width = _width
	height = _height
	
	image_xscale = width / sprite_width
	image_yscale = height / sprite_height
}