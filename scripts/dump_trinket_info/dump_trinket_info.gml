
function dump_trinket_info() {
	var lineSpacing = 16
	
	draw_set_alpha(0.5)
	draw_rectangle(0, 0, 200, 1000, false)
	draw_set_alpha(1)
	
	with (obj_player) {
		for (var i = 0; i < array_length(trinkets); i++) {
			var drawText = trinkets[i].name + " " + string(trinkets[i].level)
			draw_set_color(c_white)
			draw_text(5, 50 + (i * lineSpacing), drawText)
		}
	}
}
