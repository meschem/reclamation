/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

hpMax = 250
hp = hpMax

damageParticles = [
	obj_ptb_dest_leaf_falling_red_a
]

deathParticles = [
	obj_ptb_dest_leaf_falling_red_a,
	obj_ptb_dest_leaf_falling_red_a,
	obj_ptb_dest_leaf_falling_red_a,
	obj_ptb_dest_leaf_falling_red_a,
	obj_ptb_dest_leaf_falling_red_a,
	obj_ptb_dest_leaf_falling_red_a,
	obj_ptb_dest_leaf_falling_red_a
]

revealList = []

onDeath = function() {
	audio_play_sound(snd_rustle_hit, 0.75, false)
}
