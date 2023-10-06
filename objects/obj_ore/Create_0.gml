event_inherited()

//pickupValue = 10

shadowSprite = spr_shadow_med
shadowOffset = 6

lifeSpan = -1

init_floating(2, 90)

onPickup = function() {
	display_weapon_upgrade_prompt()
	
	instance_destroy()
}
