/// @description			Grabs a color
/// @param {real}	color	Uses enum color
/// @return {constant.Color}

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
			break
			
		case colors.blue:
			return obj_game_controller.color_blue
			break
			
		case colors.yellow:
			return obj_game_controller.color_yellow
			break
			
		case colors.green:
			return obj_game_controller.color_green
			break
			
		case colors.teal:
			return obj_game_controller.color_teal
			break
			
		case colors.purple:
			return obj_game_controller.color_purple
			break
			
		case colors.aqua:
			return obj_game_controller.color_aqua
			break
			
		case colors.dark:
			return obj_game_controller.color_black
			break
			
		case colors.white:
			return c_white
			break
			
		case colors.black:
			return c_black
			break

		default:
			show_error("Invalid color requested", false)
			return c_white
			break
	}
}

/// @description			Alias for get_color
/// @param {real}	color	Uses enum color
/// @return {constant.Color}

function col(color) {
	return get_color(color)
}