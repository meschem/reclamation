draw_sprite_ext(
	spr_px_black, 0,
	0,
	camera_get_view_height(view_camera[0]) - 7,
	camera_get_view_width(view_camera[0]),
	4,
	0,
	c_white,
	1
)

var maxPips = ceil(obj_player.maxHp / playerHealthPerPip)
var fillPips = floor(obj_player.hp / playerHealthPerPip)
var sprWidth = sprite_get_width(spr_health_pip) - 2
var healthBarX = 2
var healthBarY = 18

draw_text(100, 5, fillPips)
draw_text(110, 5, maxPips)

for (var i = 0; i < maxPips; i++) {
	var yOffset = (i % 2 = 0) ? 0 : 3

	draw_sprite(
		spr_health_pip_outline, 0,
		healthBarX + (i * sprWidth), 
		healthBarY + yOffset
	)
}

for (var i = 0; i < maxPips; i++) {
	var yOffset = (i % 2 = 0) ? 0 : 3
	var pipFrame = (i < fillPips) ? 0 : 1
	
	draw_sprite(
		spr_health_pip, pipFrame,
		healthBarX + (i * sprWidth), 
		healthBarY + yOffset
	)
}
