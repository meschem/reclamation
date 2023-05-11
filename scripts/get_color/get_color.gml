/// @description			Grabs a color
/// @param {real}	color	Uses enum color
/// @return {any}

function get_color(color) {
	enum colors {
		white,
		black,
		red,
		blue,
		yellow,
		green,
		teal,
		purple,
		aqua,
		dark,
		length
	}
	
	switch (color) {
		case colors.red:
			return obj_game_controller.color_red
						
		case colors.blue:
			return obj_game_controller.color_blue
						
		case colors.yellow:
			return obj_game_controller.color_yellow
						
		case colors.green:
			return obj_game_controller.color_green
						
		case colors.teal:
			return obj_game_controller.color_teal
						
		case colors.purple:
			return obj_game_controller.color_purple
						
		case colors.aqua:
			return obj_game_controller.color_aqua
						
		case colors.dark:
			return obj_game_controller.color_black
						
		case colors.white:
			return c_white
						
		case colors.black:
			return c_black
			
		default:
			show_error("Invalid color requested", false)
			return c_white
	}
}

/// @description			Alias for get_color
/// @param {real}	color	Uses enum color
/// @return {constant.Color}

function col(color) {
	return get_color(color)
}