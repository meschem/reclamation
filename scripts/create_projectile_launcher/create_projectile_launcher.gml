///@description   Description
///@param {asset.GMObject} _projectile
///@param {real} _count
///@param {real} _cooldown
///@param {real} _velocityMin
///@param {real} _velocityMax
///@param {id.Instance} _owner
///@param {real} _launchAngleType			Uses enum launchAngleTypes
///@param {real} _angle
///@return {id.Instance}
function create_projectile_launcher(_projectile, _count, _cooldown, _velocityMin, _velocityMax, _owner = id, _launchAngleType = launchAngleTypes.staticAngle, _angle = 0) {
	var _inst = create_instance(obj_projectile_launcher)
	
	_inst.projectile = _projectile
	_inst.projectileCount = _count
	_inst.cooldownMax = _cooldown
	_inst.owner = _owner
	_inst.launchVelocityMin = _velocityMin
	_inst.launchVelocityMax = _velocityMax
	_inst.launchAngleType = _launchAngleType
	_inst.launchAngle = _angle
	
	return _inst
}
