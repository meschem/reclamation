///@description		Returns true if a baddie is stopped
///@return {bool}
function baddie_is_stopped() {
	if (abs(lastX - x) < 0.02 && abs(lastY - y) < 0.02) {
		return true
	}
	
	return false
}