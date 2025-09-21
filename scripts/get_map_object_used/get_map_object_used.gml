///@description							Checks if a map object has been used
///@param {id.Instance} _id				Id of instance to check the status of
///@return {bool}
function get_map_object_used(_id = id) {
	with (obj_run_controller) {
		for (var i = 0; i < array_length(usedObjects); i++) {
			if (usedObjects[i] == _id) {
				return true
			}
		}
	}
	
	return false
}