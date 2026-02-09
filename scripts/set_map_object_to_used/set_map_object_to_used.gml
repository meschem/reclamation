///@description							Registers an object to a used state for the run
///@param {id.Instance} _id				Id of instance to check the status of
function set_map_object_to_used(_id = id) {
	with (obj_run_controller) {
		array_push(usedObjects, _id)
	}
}