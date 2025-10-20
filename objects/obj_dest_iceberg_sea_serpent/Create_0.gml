/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

hpMax = 100
hp = hpMax
angle = 0

damageParticles = [
	obj_ptb_dest_ice_chunk_med,
	obj_ptb_dest_ice_chunk_small
]

deathParticles = [
	obj_ptb_dest_ice_chunk_med,
	obj_ptb_dest_ice_chunk_med,
	obj_ptb_dest_ice_chunk_med,
	obj_ptb_dest_ice_chunk_med,
	obj_ptb_dest_ice_chunk_small,
	obj_ptb_dest_ice_chunk_small,
	obj_ptb_dest_ice_chunk_small,
	obj_ptb_dest_ice_chunk_small,
]

onDamaged = function() {
	audio_play_random_sound([snd_ice_hit_01, snd_ice_hit_02])
}

onDeath = function() {
	if (age >= lifeSpan) {
		launch_projectile(obj_enemy_ice_shot, angle + 90, 1.5)
		launch_projectile(obj_enemy_ice_shot, angle - 90, 1.5)
	}
	audio_play_sound(snd_ice_break, 1, false)
}