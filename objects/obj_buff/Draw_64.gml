/// @description Insert description here
// You can write your code in this editor

if (disarm) {
	draw_set_font(font_pixelmix_s)
	draw_set_color(get_color(colors.white))
	
	var uiPos = get_ui_pos(owner)
	
	draw_text(
		uiPos.x - 15, uiPos.y - 30, "Disarmed!"
	)
}
