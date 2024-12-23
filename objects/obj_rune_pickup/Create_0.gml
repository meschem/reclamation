///@description Init

event_inherited()

lifeSpan = 9999
homesOnPlayer = false

image_speed = 0

///@param {id.Instance} _player
onPickup = function(_player) {
	display_level_rune_prompt(_player, "You got a Rune!")
	instance_destroy()
}