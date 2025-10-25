
draw_sprite(sprBack, 0, drawStart.x, drawStart.y)
draw_sprite_part(sprFilling, 0, 0, 0, drawWidthFilling, drawHeight, drawStart.x, drawStart.y)
draw_sprite_part(sprFill, 0, 0, 0, drawWidth, drawHeight, drawStart.x, drawStart.y)

draw_set_font(font_alagard)
draw_text_with_outline(drawTextLevelLoc.x, drawTextLevelLoc.y, player.level)
