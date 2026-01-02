///@description						Gets a random object of a type
///@param {asset.GMObject} obj		Object to test against
///@return {id.Instance}			Instance chosen

function get_random_instance(obj) {
	var count = instance_number(obj)
	var inst = instance_find(obj, irandom(count - 1))
	
	if (inst < 0) {
        return noone
    }
	
	return inst
}
