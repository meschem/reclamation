
// Inherit the parent event
event_inherited()

boss = obj_naga_boss

mapIcon = spr_poi_obelisk
add_map_poi()

deathParticleSpawnRange = new vec2(20, 30)

deathParticles = [
	obj_ptb_dest_rock_purp_small,
	obj_ptb_dest_rock_purp_small,
	obj_ptb_dest_rock_purp_small,
	obj_ptb_dest_rock_purp_small,
	obj_ptb_dest_rock_purp_small,
	obj_ptb_dest_rock_purp_small,
	obj_ptb_dest_rock_purp_small,
	obj_ptb_dest_rock_purp_small,
	obj_ptb_dest_rock_purp_med,
	obj_ptb_dest_rock_purp_med,
	obj_ptb_dest_rock_purp_med,
	obj_ptb_dest_rock_purp_med,
	obj_ptb_dest_rock_purp_med,
	obj_ptb_dest_rock_purp_med,
	obj_ptb_dest_rock_purp_med,
	obj_ptb_dest_obelisk_top_purp
]

init_floating(1, 120)

activate = function() {
	var _inst = instance_create_depth(x, y, depths.enemy, obj_boss_summoner)
	
	_inst.boss = boss
	
	instance_destroy()
}