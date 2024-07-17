///@description   Description
///@param {string} side
function get_facing_angle_from_spawn_side(side) {
	switch (side) {
		case "left":
			return 0
					
		case "right":
			return 180
					
		case "top":
			return 270
					
		case "bottom":
			return 90
					
		default:
			show_error($"Bad spawnSide set on spawn: {spawns[0].spawnSide}", true)
		break
	}
	
	return 0
}