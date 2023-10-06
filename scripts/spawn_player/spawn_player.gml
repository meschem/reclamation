///@description   Description
///@return {Id.Instance}
function spawn_player() {
	var inst = instance_create_depth(
		obj_player_spawn.x,
		obj_player_spawn.y,
		depths.player,
		obj_jonah
	)
	
	return inst
}