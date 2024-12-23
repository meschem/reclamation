event_inherited()

pickupValue = 10
//lifeSpan = seconds_to_frames(12)
lifeSpan = -1

shadowSprite = spr_shadow_med
shadowOffset = 6

init_floating(2, 90)

onPickup = function() {
	add_player_health(pickupValue)
	
	var txt = create_moving_text(pickupValue, x, y, movingTextTypes.floating)
	
	txt.fontColor = get_color(colors.red)
	
	instance_destroy()
}
