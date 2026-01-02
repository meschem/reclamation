///@description							              Spawns a pickups from a location
///@param {asset.GMObject|id.Instance} _pickupObj	  Pickup to spawn
///@param {real} _x
///@param {real} _y
///@param {constant.Color} _color
///@param {real} _maxDistance			              Max distance it can spawn from center
///@return {id.Instance}				              Lob projectile instance
function create_pickup_with_lob(_pickupObj, _x, _y, _color = c_white, _maxDistance = 90) { 
	var _distance = random_range(_maxDistance * 0.75, _maxDistance)
	var _angle = random(360)
	var _offsetX = angle_xvel(_angle) * _distance
	var _offsetY = angle_yvel(_angle) * _distance
    var _pickup = noone
    
    if (!instance_exists(_pickupObj)) {
        _pickup = instance_create_depth(-99, -99, depths.player, _pickupObj)
    } else {
        _pickup = _pickupObj
    }
    
    _pickup.spawning = true
	_pickup.image_alpha = 0
	_pickup.flashBlendDuration = stf(0.75)
	
	var _lob = instance_create_depth(_x, _y, depths.playerProjectile, obj_pickup_spawner_lob)
    
	_lob.startX = _x
	_lob.startY = _y
	_lob.targetX = _x + _offsetX
	_lob.targetY = _y + _offsetY
	_lob.itemToSpawn = _pickup
	_lob.ribbonColor = _color
	_lob.image_blend = _color
	
	return _lob
}
