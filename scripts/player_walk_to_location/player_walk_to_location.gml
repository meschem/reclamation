/// @description Has an object try to move towards a location. Returns true if collided with a wall.
/// @param {real}		xVel
/// @param {real}		yVel
/// @return {bool}

function player_walk_to_location(xVel, yVel) {
	var hitWall = false;
	var steps = 0
	
	if (!phases && place_meeting(x + xVel, y, [obj_pit, obj_player_clip, obj_doodad])) {
		hitWall = true
		
	    while(!place_meeting(x + sign(xVel), y, [obj_pit, obj_player_clip, obj_doodad])) {
	        x += sign(xVel)
			steps++
			
			if (steps > abs(xVel)) {
				break
			}
	    }
	   
	    xVel = 0
	} else {
		x += xVel
	}
	
	if (!phases && place_meeting(x, y + yVel, [obj_pit, obj_player_clip, obj_doodad])) {
		steps = 0
		hitWall = true
		
	    while(!place_meeting(x, y + sign(yVel), [obj_pit, obj_player_clip, obj_doodad])) {
	        y += sign(yVel)
			
			steps++
			
			if (steps > abs(yVel)) {
				break
			}
	    }
	   
	    yVel = 0;
	} else {
		y += yVel;
	}
	
	return hitWall
}
