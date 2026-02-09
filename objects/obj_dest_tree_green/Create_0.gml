// Inherit the parent event
event_inherited()

hpMax = 250
hp = hpMax

damageParticles = [
	obj_ptb_dest_leaf_falling_sm
]

deathParticles = [
	obj_ptb_dest_leaf_falling_md,
	obj_ptb_dest_leaf_falling_md,
	obj_ptb_dest_leaf_falling_sm,
	obj_ptb_dest_leaf_falling_sm,
	obj_ptb_dest_leaf_falling_sm,
	obj_ptb_dest_leaf_falling_sm
]

revealList = []

onDeath = function() {
	audio_play_sound(snd_rustle_hit, 0.75, false)
}
