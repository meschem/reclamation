event_inherited()

pickupValue = 500

lifeSpan = -1

shadowSprite = spr_shadow_med
shadowOffset = 6

init_floating(2, 90)

onPickup = function(_player) {
	obj_player.xp += pickupValue
	check_for_level_up()
}