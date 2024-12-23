/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

homesOnPlayer = false
lifeSpan = -1
floats = true

init_floating(2, 90)

shadowSprite = spr_shadow_med

///@param {id.Instance} _player
onPickup = function(_player) {
	array_push(_player.keys, object_index)
	audio_play_sound(snd_key_snatch, 1, false)
	instance_destroy()
	//create_toaster("Obtained: DEFAULT KEY")
}