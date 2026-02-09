///@description		Setup and draw to mirror surface

draw_clear_alpha(c_black, 0)

if (!active) {
	return 0
}

if (!surface_exists(surfaceMirror)) {
	surfaceMirror = surface_create(surfaceWidth, surfaceHeight)
}

surface_set_target(surfaceMirror)

draw_clear_alpha(c_black, 0)
draw_set_color(c_black)

var _posX = camera_get_view_x(camera)
var _posY = camera_get_view_y(camera)

for (var i = 0; i < array_length(reflectedInstances); i++) {
	with (reflectedInstances[i]) {
		var _drawX = x - _posX
		var _drawY = y - _posY + reflectOffsetY
		var _yOffset = 0
		
		if (variable_instance_exists(id, "floatOffset")) {
			_yOffset -= floatOffset
		}
        
        if (variable_instance_exists(id, "zOffset")) {
			_yOffset -= zOffset
		}

		draw_sprite_ext(
			sprite_index,
			image_index,
			_drawX,
			_drawY + reflectOffsetY + _yOffset,
			image_xscale,
			-image_yscale,
			image_angle,
			image_blend,
			image_alpha
		)
	}
}

surface_reset_target()
