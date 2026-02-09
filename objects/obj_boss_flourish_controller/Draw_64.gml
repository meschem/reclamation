
draw_set_color(bannerBorderColor)
draw_rectangle(
	bannerDrawInfo.x1,
	bannerDrawInfo.y1 - bannerBorderWidth,
	bannerDrawInfo.x2,
	bannerDrawInfo.y2 + bannerBorderWidth,
	false
)

draw_set_color(bannerColor)
draw_rectangle(
	bannerDrawInfo.x1,
	bannerDrawInfo.y1,
	bannerDrawInfo.x2,
	bannerDrawInfo.y2,
	false
)

draw_sprite_ext(
	bossSprite,
	0,
	view_width() - sprite_get_width(bossSprite),
	view_height() - sprite_get_height(bossSprite),// + sprite_get_yoffset(bossSprite),
	-bossSpriteScale, bossSpriteScale,
	0, c_white, 1
)

draw_set_font(font_alagard_lg)
draw_set_color(get_color(colors.dark))
draw_text(textPaddingLeft + 2, bannerDrawInfo.y1 + textPaddingTop + 2, bossName)

draw_set_font(font_alagard_lg)
draw_set_color(c_white)
draw_text(textPaddingLeft, bannerDrawInfo.y1 + textPaddingTop, bossName)

draw_set_font(font_alagard)
draw_text(textPaddingLeft, bannerDrawInfo.y1 + textPaddingTop + titleOffset, bossTitle)