///@description						Creates an instance at 0, 0 with depth 0
///@param {asset.GMObject} object	Object to create
///@return {id.Instance}

function create_instance(object) { 
	return instance_create_depth(0, 0, 0, object)
}