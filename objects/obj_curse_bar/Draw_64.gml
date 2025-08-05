/// @description Insert description here
// You can write your code in this editor


draw_sprite_bottom_n(sprite_index, 2, x, y, fillDrawHeight)
draw_sprite_bottom_n(sprite_index, 0, x, y, backingDrawHeight)
draw_sprite_bottom_n(sprite_index, 1, x, y, fillDrawHeight)
draw_sprite(spr_curse_bar_bottom, 1, x, y + sprite_height)

for (var i = 0; i < skullCount; i++) {
	var _y = skullBotY - skullBotPadding - ((i + 1) * sprite_get_height(skullSprSm))	
	
	if (i < skullFullCount) {
		if ((i + 1) % 4 == 0) {
			draw_sprite(skullSprMd, 2, x + 2, _y - 2)
		} else {
			draw_sprite(skullSprSm, 2, x + 3, _y)
		}
	} else {
		if ((i + 1) % 4 == 0) {
			draw_sprite(skullSprMd, 0, x + 2, _y - 2)
		} else {
			draw_sprite(skullSprSm, 0, x + 3, _y)
		}
	}
}
