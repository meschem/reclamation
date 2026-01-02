//draw_self()

draw_sprite_ext(
	sprite_index,
	image_index,
	x + focusOffsetX,
	y + drawOffsetY + focusOffsetY,
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
)


if (state == buttonStates.spawning) {
	return 0
}

if (titleBackgroundDraw) {
    draw_sprite_ext(
        titleBackground, 0,
        x + titleBackgroundDrawX,
        y + titleBackgroundDrawY,
        titleBackgroundWidth / sprite_get_width(titleBackground),
        1,
        0,
        c_white,
        1
    )
}

draw_set_font(titleText.font)
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
