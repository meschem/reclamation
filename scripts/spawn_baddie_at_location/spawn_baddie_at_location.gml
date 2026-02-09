///@description						Spawns baddies in a random location around the border
///@param {asset.GMObject} enemy	Enemy to spawn
///@param {real} _x					Amount of enemies to spawn
///@param {real} _y					Distance between enemies if count > 1
///@param {bool} _applyScaling		Applie run scaling to the baddie
///@return {id.Instance}
function spawn_baddie_at_location(enemy, _x, _y, _applyScaling = true) {
	var _inst
	
	_inst = instance_create_depth(_x, _y, depths.enemy, enemy)
	
	//with (_inst)
	//	move_until_free(collisionSearchTypes.radial)
		
	if (_applyScaling)
		apply_baddie_scaling(_inst)
	
	return _inst
}
