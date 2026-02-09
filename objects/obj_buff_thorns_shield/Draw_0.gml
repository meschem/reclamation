var player = obj_player // get_player_target()
var draw = true

if (timer < 120) {
	draw = (get_current_frame() % 4 == 0)
}

if (draw) {
	draw_sprite_ext(
		sprite, 0,
		player.x, player.y - 7,
		1, 1, 0, c_white,
		0.8
	)
}