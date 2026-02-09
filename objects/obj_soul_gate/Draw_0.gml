
draw_sprite_ext(
	shadowSprite,
	0,
	x,
	y + shadowOffset,
	image_xscale,
	image_yscale,
	0, c_white, 1
)

draw_sprite_ext(
	sprite_index,
	image_index,
	x, y + floatOffset,
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
)

if(!surface_exists(surf)) {
	surf = surface_create(activeAreaRadius * 2, activeAreaRadius * 2)

	surface_set_target(surf)
	draw_clear_alpha(c_black, 0)

	draw_circle_color(activeAreaRadius, activeAreaRadius, activeAreaRadius, activeAreaDrawColor, activeAreaDrawColor, false)
	gpu_set_blendmode(bm_subtract)
	draw_circle_color(activeAreaRadius, activeAreaRadius, activeAreaRadius - activeAreaDrawWidth, c_white, c_white, false)

	gpu_set_blendmode(bm_normal)
	surface_reset_target()
}

draw_surface(surf, x - activeAreaRadius, y - activeAreaRadius)
