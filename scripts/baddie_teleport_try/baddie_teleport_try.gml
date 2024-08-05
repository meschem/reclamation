///@description   Description
function baddie_teleport_try(){
	var findingSpot = true
	var sanityCount = 0
	var spot = new vec2()
	var player = obj_player // get_player_target()

	while(findingSpot) {
		sanityCount++
		
		if (sanityCount > 100) {
			show_error("sanityCount hit for teleporting", false)
		}
		
		spot = get_random_play_point()
		
		if (point_distance(player.x, player.y, spot.x, spot.y) > teleportMinDistanceToTarget) {
			findingSpot = false
		}
	}
	
	instance_create_depth(spot.x, spot.y, depths.fx, teleportFx)
	
	x = spot.x
	y = spot.y
}
