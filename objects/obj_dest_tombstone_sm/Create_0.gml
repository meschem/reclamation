/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

damageParticles = [
	obj_ptb_dest_rock_purp_med,
	obj_ptb_dest_rock_purp_med
]

deathParticles = [
	obj_ptb_dest_rock_purp_small,
	obj_ptb_dest_rock_purp_small,
	obj_ptb_dest_rock_purp_med,
	obj_ptb_dest_rock_purp_med,
	obj_ptb_dest_rock_purp_med,
	obj_ptb_dest_rock_purp_med
]

image_index = floor(random(6))


onDeath = function() {
	var _vol = random_range(0.3, 0.38)
	if (random(1) < 0.5) {
		audio_play_sound(snd_stone_crunch_01, 1, false, _vol)
	} else {
		audio_play_sound(snd_stone_crunch_02, 1, false, _vol)
	}
}