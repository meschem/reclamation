///@description				Gets a random obj_baddie that exists. Returns noone if none exist
///@return {id.Instance}
function get_random_baddie() {
	var count = instance_number(obj_baddie)
	
	if (count == 0) {
		return noone
	}
	
	var index = floor(random(count))
	
	return instance_find(obj_baddie, index)
}