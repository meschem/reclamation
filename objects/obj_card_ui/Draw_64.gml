draw_self()

draw_set_font(font_pxlxxl_m)
draw_set_color(c_white)

titleText.draw(x + menuOffset.x, y + menuOffset.y)

//draw_set_font(font_pxlxxl_s)
//draw_set_color(c_white)

if (subTitleEnabled) {
	subTitleText.draw(x + menuOffset.x, y + menuOffset.y)
}

draw_set_font(font_pixelmix_s)

bodyText.draw(x + menuOffset.x, y + menuOffset.y)

if (statTextEnabled) {
	statText.draw(x + menuOffset.x, y + menuOffset.y)
}

if (topIcon != spr_none) {
	draw_sprite(topIcon, 0, x + buttonXOffset, y + buttonYOffset)
	
	if (iconOverlay != spr_none) {
		draw_sprite(iconOverlay, 0, x + buttonXOffset, y + buttonYOffset)
	}
}
