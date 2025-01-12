/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

hpMax = 150
hp = 150

damageParticles = [
	obj_ptb_dest_rock_purp_med,
	obj_ptb_dest_rock_purp_med
]

deathParticles = [
	obj_ptb_dest_rock_purp_small,
	obj_ptb_dest_rock_purp_small,
	obj_ptb_dest_rock_purp_small,
	obj_ptb_dest_rock_purp_small,
	obj_ptb_dest_rock_purp_med,
	obj_ptb_dest_rock_purp_med,
	obj_ptb_dest_rock_purp_med
]

onDeath = function() {
	instance_create_depth(x + 18, y - 4, depths.enemy, obj_u_odinok)
	instance_create_depth(x - 18, y - 4, depths.enemy, obj_u_claudius)
}