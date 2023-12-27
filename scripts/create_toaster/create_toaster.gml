///@description					Creates a toaster message
///@param {string} msg			Message to create
///@param {real} errorLevel		Error level. Uses enum 
function create_toaster(msg, errorLevel = errorLevels.normal) {
	
	var inst = create_instance(obj_toaster)
	
	inst.textMessage = msg
	inst.errorLevel = errorLevel
}