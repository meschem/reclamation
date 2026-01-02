
draw_sprite_ext(
	titleboard.sprite,
	2,
	titleboard.x,
	titleboard.y,
	titleboard.width / sprite_get_width(titleboard.sprite),
	titleboard.height / sprite_get_height(titleboard.sprite),
	0,
	c_white,
	1
	
)

draw_set_font(titleboard.headerFont)
draw_text(titleboard.textHeaderX, titleboard.textHeaderY, titleboard.textHeader)

draw_set_font(titleboard.bodyFont)
draw_text(titleboard.textBodyX, titleboard.textBodyY, titleboard.textBody)
