
event_inherited()

//var inst = instance_create_depth(x, y, depths.enemyProjectile, obj_fire_pit)

var inst = instance_create_depth(x, y, depths.enemyProjectile, obj_enemy_red_shot)

with (inst) {
	accel_towards_point(obj_player.x, obj_player.y, 0.1)
}
