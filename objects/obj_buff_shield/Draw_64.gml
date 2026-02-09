
event_inherited()

var _pos = get_ui_pos(owner)

for (var i = 10; i <= hpMax; i += 10) {
	if (i <= hp) {
		draw_set_color(c_orange)
	} else {
		draw_set_color(c_black)
	}
	
	draw_rectangle(
		(_pos.x - 20) + (i / 2),
		(_pos.y - 30),
		(_pos.x - 20) + (i / 2) + 3,
		(_pos.y - 30) + 3,
		false
	)
}
