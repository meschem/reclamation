
//if (!display) {
//	return 0
//}

//draw_self()

//if (state == buttonStates.disabled) {
//	draw_set_color(c_gray)
//} else {
//	draw_set_color(c_white)
//}

event_inherited()

if (item != noone) {
	draw_text(x + 10, y + 9, item.name)
	draw_text(x + 10, y + 28, item.cost)
}
