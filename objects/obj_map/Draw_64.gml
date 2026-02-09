/// @description Insert description here
// You can write your code in this editor

if (drawStyle != mapDrawStyles.none) {
	draw_sprite_ext(
		sprite_index,
		image_index,
		drawLocation.x,
		drawLocation.y,
		image_xscale,
		image_yscale,
		image_angle,
		c_white,
		image_alpha
	)

	for (var i = 0; i < array_length(poiDrawInfo); i++) {
		draw_sprite(
			poiDrawInfo[i].sprite,
			poiDrawInfo[i].frame,
			drawLocation.x + poiDrawInfo[i].x,
			drawLocation.y + poiDrawInfo[i].y
		)
	}
}