/// @description 

if (!active) {
	return 0
}

draw_set_font(font_dogica_s)
draw_sprite(spr_coin_icon, 0, guiPos.x - 10, guiPos.y + 17)
draw_text_with_outline(
	guiPos.x - 3, guiPos.y + 11, cost
)

if (drawCantOpen) {
	draw_sprite(cantOpenSprite, 0, guiPos.x - 1, guiPos.y)
}

if (drawOpenPrompt) {	
	var _string = ""
	var _pos = get_ui_pos(openingPlayer)
	
	if (get_player_input_type(openingPlayer) == enumInputTypes.controller) {
		_string = endString
		var _sprite = get_button_sprite_from_input(controllerInput)
		
		draw_sprite(_sprite, 0, _pos.x + infoTextOffset.x, _pos.y + infoTextOffset.y - 2)
		
		draw_set_color(c_black)		
		draw_text(_pos.x + infoTextOffset.x + 18 + 1, _pos.y + infoTextOffset.y + 1, _string)
		
		draw_set_color(c_white)		
		draw_text(_pos.x + infoTextOffset.x + 18, _pos.y + infoTextOffset.y, _string)
	} else {
		_string = $"\"{keyboardInput}\" {endString}"
		
		draw_set_color(c_black)		
		draw_text(_pos.x + infoTextOffset.x + 1, _pos.y + infoTextOffset.y + 1, _string)
		
		draw_set_color(c_white)		
		draw_text(_pos.x + infoTextOffset.x, _pos.y + infoTextOffset.y, _string)
	}
}