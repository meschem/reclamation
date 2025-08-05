
if (!valueSet) {
	return 0
}

var _offset = 0

if (crit) {
	draw_sprite_ext(spr_dmg_numbers, 10, x - _offset, y, 1, 1, 0, image_blend, image_alpha)
	_offset += 4
}

for (var i = 0; i < array_length(digits); i++) {
	draw_sprite_ext(spr_dmg_numbers, digits[i], x - _offset, y, 1, 1, 0, image_blend, image_alpha)
	_offset += 4
}
