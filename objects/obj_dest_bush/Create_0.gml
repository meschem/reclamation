/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

hpMax = 10
hp = hpMax

damageParticles = [
	obj_ptb_dest_leaf_falling_md
]

deathParticles = [
	obj_ptb_dest_leaf_falling_md,
	obj_ptb_dest_leaf_falling_md,
	obj_ptb_dest_leaf_falling_sm,
	obj_ptb_dest_leaf_falling_sm,
	obj_ptb_dest_leaf_falling_sm,
	obj_ptb_dest_leaf_falling_sm
]

onDeath = function() {
	audio_play_sound(snd_rustle_hit, 0.75, false)
}