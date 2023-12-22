///@description				Creates a toaster message
///@param {string} msg		Message to create
function create_toaster(msg) {
	var inst = create_instance(obj_toaster)
	
	inst.textMessage = msg
}