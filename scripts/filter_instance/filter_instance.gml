///@description							Checks if an object meets a filter
///@param {id.Instance} instance		Instance to check
///@param {struct} filter				See if it passes filter
///@return {bool}

function filter_instance(instance, filter) {
	refInstance = instance
	returnValue = true
	
	struct_foreach(filter, function(_key, _value) {
		var key = variable_instance_get(refInstance, _key)
	
		if (key != _value) {
			returnValue = false
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