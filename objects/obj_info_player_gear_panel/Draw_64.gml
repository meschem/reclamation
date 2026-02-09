
draw_self()

draw_set_color(c_white)

draw_text(x + padding, y + padding, title)

index = 0

struct_foreach(owner.equipment, function(_key, _value) {
	if (_value == noone) {
		draw_set_color(c_gray)
		gearString = "Empty"
	} else {
		draw_set_color(c_white)
		gearString = _value.name
	}
	
	draw_text(
		x + padding,
		y + padding + lineHeight + padding + (lineHeight * index),
		$"{_key}: {gearString}"
	)
	
	index++
})
