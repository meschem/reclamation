///@description		Gets the current combat room type
///@return {real}
function get_combat_room_type() {
	with (obj_room_controller) {
		return combatRoomType
	}
	
	show_message("No Obj Room Controller found")
	
	return 0
}
