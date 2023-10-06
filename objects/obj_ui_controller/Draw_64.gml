// Draw XP Bar

draw_set_color(c_white)

draw_text(
	5, camera_get_view_height(view_camera[0]) - 24,
	obj_player.level
)

draw_sprite_ext(
	spr_px_black, 0,
	0,
	camera_get_view_height(view_camera[0]) - 10,
	camera_get_view_width(view_camera[0]),
	10,
	0,
	c_white,
	1
)

draw_sprite_ext(
	spr_px_purple, 0,
	1,
	camera_get_view_height(view_camera[0]) - 10 + 1,
	xpRatio * (camera_get_view_width(view_camera[0]) - 1),
	8 - 1,
	0,
	c_white,
	1
)

// Draw Health Pips

var maxPips = ceil(obj_player.maxHp / playerHealthPerPip)
var fillPips = floor(obj_player.hp / playerHealthPerPip)
var sprWidth = sprite_get_width(spr_health_pip) - 2
var healthBarX = 2
var healthBarY = 18

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

// Draw Gold

draw_text(
	camera_get_view_width(view_camera[0]) - 80,
	2,
	"Gold: " + string(obj_player.gold)
)