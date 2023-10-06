event_inherited()

lifeSpan = 9999
homesOnPlayer = false

image_speed = 0

onPickup = function() {
	display_level_rune_prompt("You got a Rune!")
	instance_destroy()
}