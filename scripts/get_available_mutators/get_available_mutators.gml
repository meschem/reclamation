///@description					Gets available mutators
function get_available_mutators() {
	var _mutators = []
	
	with (obj_mutator_parent) {
		if (!enabled) {
			array_push(_mutators, id)
		}
	}
	
	return _mutators
}
