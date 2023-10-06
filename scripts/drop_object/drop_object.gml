///@description						Drops an orb at a location
///@param {asset.GMObject} object	Object to drop	
///@param {real} _x					X location
///@param {real} _y					Y location
function drop_object(object, _x, _y) {
	_x += irandom_range(-4, 4)
	_y += irandom_range(-4, 4)
	
	var inst = instance_create_depth(_x, _y, depths.enemy, object)

	return inst
}