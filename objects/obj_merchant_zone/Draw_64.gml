/// @description Draws the "Press button overlay"

var _player = get_first_player()
var _pos = get_ui_pos(_player)
var _string = ""

if (playerInArea) {
	draw_set_font(font_dogica_s)
	
	if (get_player_input_type(_player) == enumInputTypes.controller) {
		_string = "to shop"
		var _sprite = get_button_sprite_from_input(controllerInput)
		
		draw_sprite(_sprite, 0, _pos.x + infoTextOffset.x, _pos.y + infoTextOffset.y - 2)
		
		draw_set_color(c_black)		
		draw_text(_pos.x + infoTextOffset.x + 18 + 1, _pos.y + infoTextOffset.y + 1, _string)
		
		draw_set_color(c_white)		
		draw_text(_pos.x + infoTextOffset.x + 18, _pos.y + infoTextOffset.y, _string)
	} else {
		_string = $"\"{keyboardInput}\" to shop"
		
		draw_set_color(c_black)		
		draw_text(_pos.x + infoTextOffset.x + 1, _pos.y + infoTextOffset.y + 1, _string)
		
		draw_set_color(c_white)		
		draw_text(_pos.x + infoTextOffset.x, _pos.y + infoTextOffset.y, _string)
	}
}