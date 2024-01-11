///@description   Description
///@param {asset.GMObject} _proj
///@param {real} _angle
///@param {real} _mag
///@param {id.Instance} _owner
///@return {id.Instance}
function launch_projectile(_proj, _angle, _mag, _owner = id) {
	var _inst = instance_create_depth(_owner.x, _owner.y, depths.enemyProjectile, _proj)
	
	set_velocity_from_angle(_inst, _angle, _mag)
	
	_inst.owner = _owner
	
	return _inst
}