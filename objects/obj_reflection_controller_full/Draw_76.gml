var _cam = view_camera[0]
var _vx = camera_get_view_x(_cam)
var _vy = camera_get_view_y(_cam)

draw_clear_alpha(c_black, 0)

var _tilemapId = layer_tilemap_get_id("Base_Tiles")

draw_tilemap(_tilemapId, _vx, _vy)

if (!surface_exists(surfaceMirror)) {
	surfaceMirror = surface_create(surfaceWidth, surfaceHeight)
}

surface_set_target(surfaceMirror)

draw_clear_alpha(c_black, 0)

var _posX = camera_get_view_x(camera)
var _posY = camera_get_view_y(camera)

with (obj_player) {
	var _drawX = x - _posX
	var _drawY = y - _posY + feetOffset

	draw_set_color(c_black)
	
	draw_sprite_ext(
		sprite_index,
		image_index,
		_drawX,
		_drawY + feetOffset,
		image_xscale,
		-image_yscale,
		image_angle,
		image_blend,
		image_alpha
	)
}

surface_reset_target()
