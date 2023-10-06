/// @description Has an object try to move towards a location. Returns true if collided with a wall.
/// @param {real}		xVel
/// @param {real}		yVel
/// @return {bool}

function player_walk_to_location(xVel, yVel) {
	var hitWall = false;
	
	// Check Player Clip

	// FIXME: Optimize - Probably bad setup for collision, may be expensive
	//if (place_meeting(x + xVel, y, obj_player_clip)) {
	//	hitWall = true
		
	//	while(!place_meeting(x + sign(xVel), y, obj_player_clip)) {
	//        x += sign(xVel)
	//    }
	//} else {
	//	x += xVel
	//}
	
	//if (place_meeting(x, y + yVel, obj_player_clip)) {
	//	hitWall = true
		
	//	while(!place_meeting(x, y + sign(yVel), obj_player_clip)) {
	//        y += sign(yVel)
	//    }
	//} else {
	//	y += yVel;
	//}

	if (!phases && place_meeting(x + xVel, y, obj_pit)) {
		hitWall = true;
		
	    while(!place_meeting(x + sign(xVel), y, obj_pit)) {
	        x += sign(xVel)
	    }
	   
	    xVel = 0
	} else {
		x += xVel
	}
	
	if (!phases && place_meeting(x, y + yVel, obj_pit)) {
		hitWall = true
		
	    while(!place_meeting(x, y + sign(yVel), obj_pit)) {
	        y += sign(yVel)
	    }
	   
	    yVel = 0;
	} else {
		y += yVel;
	}
	
	return hitWall
}
