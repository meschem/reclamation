
if (!valueSet) {
	return 0
}

var _offset = 0
var _index = 0

if (icon != spr_none) {
	draw_sprite_ext(icon, 0, x - _offset + iconOffsetX, y - 1, 1, 1, 0, c_white, image_alpha)
}

for (var i = 0; i < array_length(digits); i++) {
    _index = array_length(digits) - 1 - i
	draw_sprite_ext(spr_dmg_numbers, digits[_index], x - _offset, y, 1, 1, 0, image_blend, image_alpha)
	_offset -= 4
}

if (crit) {
	draw_sprite_ext(spr_dmg_numbers, 10, x - _offset, y, 1, 1, 0, image_blend, image_alpha)
	_offset -= 4
}
