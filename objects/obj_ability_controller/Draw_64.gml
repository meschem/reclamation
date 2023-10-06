/// @description

draw_sprite(spr_ability_icon_backing, 0, x, y)
draw_self()
draw_set_font(font_pixellari)

var yOffset = 25

if (cooldown > 0) {	
	var drawString = ceil(cooldown / 60)
	
	draw_set_color(c_black)
	draw_text(x + 6, y + yOffset + 1, drawString)
	
	draw_set_color(c_orange)
	draw_text(x + 5, y + yOffset, drawString)
} else {
	show_message("drawing")
	draw_set_color(c_black)
	
	if (owner.inputFocus == enumInputTypes.keyboardMouse) {
		draw_text(x + 9, y + yOffset + 1, hotkey)
	} else {
		draw_sprite(x + 9, 0, y + yOffset + 1, controllerIcon)
	}
	
	draw_set_color(c_white)
	
	if (owner.inputFocus == enumInputTypes.keyboardMouse) {
		draw_text(x + 8, y + yOffset, hotkey)
	} else {
		draw_sprite(x + 8, 0, y + yOffset + 1, controllerIcon)
	}
	
}
