
event_inherited()

spawn_fx_bouncers(bouncers, 90)

var _inst = instance_create_depth(x, y - 45, depths.fx, obj_ptb_dest_obelisk_swarm_chunk_top)
_inst.angleInit = 90
_inst.magMultiplier = 1.5
