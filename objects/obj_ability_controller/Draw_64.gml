/// @description

draw_sprite(spr_ability_icon_backing, 0, x, y)
draw_self()
draw_set_font(font_pxlxxl_m)

var yOffset = 25

if (cooldown > 0) {	
	var drawString = ceil(cooldown / 60)
	
	draw_set_color(c_black)
	draw_text(x + 6, y + yOffset + 1, drawString)
	
	draw_set_color(c_orange)
	draw_text(x + 5, y + yOffset, drawString)
} else {
	draw_set_color(c_black)
	draw_text(x + 9, y + yOffset + 1, hotkey)
	
	draw_set_color(c_white)
	draw_text(x + 8, y + yOffset, hotkey)
}
