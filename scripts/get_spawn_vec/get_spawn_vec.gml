///@description					Finds a spawn location where the object will not overlap a collider
///@param {asset.GMObject} obj	Object to spawn
///@param {real} _x				Desired X location
///@param {real} _y				Desired Y point
///@return {struct.vec2}		Returns a vector

function get_spawn_vec(obj, _x, _y) {
	var xTest = _x
	var yTest = _y
	
	do {
		place_empty()
	} until (
		true
	)
	
	var spawnVec = new vec2(xTest, yTest)
	
	return spawnVec
}