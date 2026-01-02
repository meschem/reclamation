event_inherited()

lifeSpan = -1

rarityMultiplier = 1

shadowSprite = spr_shadow_med
shadowOffset = 6
attachedMerger = noone
spawning = false

image_speed = 0

init_floating(2, 90)

onPickup = function(_player) {
	if (attachedMerger == noone) {
		create_toaster("Error: No merger attached to globe", errorLevels.error)
		return 0
	}
	
	attachedMerger.owner = _player
	_player.backpack.addItem(attachedMerger)
	
	instance_destroy()
}
