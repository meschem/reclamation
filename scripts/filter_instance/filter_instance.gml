///@description							Checks if an object meets a filter
///@param {id.Instance} instance		Instance to check
///@param {struct} filter				See if it passes filter
///@return {bool}

function filter_instance(instance, filter) {
	refInstance = instance
	returnValue = true
	
	struct_foreach(filter, function(_key, _value) {
		if (is_array(_value)) {
			show_message("filtering by array not in yet")
		} else {
			if (variable_instance_exists(refInstance, _key)) {
				var key = variable_instance_get(refInstance, _key)
			} else {
				create_toaster("Bad key lookup for equipment filter: " + _key)
			}
			
			show_message($"{key} _vs_ {_value}")
	
			if (key != _value) {
				returnValue = false
			}
		}
	})
	
	return returnValue
}

enum filterTypes {
	equals,
	contains,
	notContains,
	greaterThan,
	lessThan
}