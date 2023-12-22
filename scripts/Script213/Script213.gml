///@description						Determines if the player can attack
///@param {id.Instance} inst		ID of player to check for
///@return {bool}
function player_can_attack(inst = id) {
	var disarmed = obj_buff_controller.getBuffBool(buffBoolTypes.disarm)
	
	if (disarmed) {
		//show_debug_message("Player Disarmed")
		
		return false
	}
	
	return true
}