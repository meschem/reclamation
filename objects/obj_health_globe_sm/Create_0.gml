event_inherited()

pickupValue = 10
//lifeSpan = seconds_to_frames(12)
lifeSpan = -1

shadowSprite = spr_shadow_med
shadowOffset = 6

init_floating(2, 90)

onPickup = function() {
	add_player_health(pickupValue)

	create_pickup_text(x, y, pickupValue, pickupTextStyles.hp)
	
	instance_destroy()
}

//if (shadowSprite >= 0) {
//	draw_sprite(
//		shadowSprite,
//		0,
//		x,
//		y + (sprite_height / 2) + shadowOffset
//	)
//}

//draw_sprite(
//	sprite_index,
//	image_index,
//	x,
//	y + floatOffset
//)