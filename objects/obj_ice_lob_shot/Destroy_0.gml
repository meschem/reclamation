
//instance_create_depth(x, y, depths.enemyProjectile, obj_fire_pit)

var _inst = instance_create_depth(x, y, depths.fx, obj_particle_single_cycle)

_inst.sprite_index = spr_blue_explosion

audio_play_sound(snd_fireball_impact_short, 2, false, 0.4)

var _berg = instance_create_depth(x, y, depths.enemyFloorFx, obj_dest_iceberg)
_berg.lifeSpan = stf(4)

