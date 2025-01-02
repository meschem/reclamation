/// @description Has an object try to move towards a location. Returns true if collided with a wall.
/// @param {real}		xVel
/// @param {real}		yVel
/// @return {bool}

function player_walk_to_location(xVel, yVel) {
	var hitWall = false;
	var steps = 0
	var layerId = layer_get_id("Collision_Tiles")
	var tileId = layer_tilemap_get_id(layerId)
	
	var collisionList = [obj_pit, obj_player_clip, obj_doodad, obj_destructible, tileId]
	
	if (!phases && place_meeting(x + xVel, y, collisionList)) {
		hitWall = true
		
	    while(!place_meeting(x + sign(xVel), y, collisionList)) {
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
	
	if (!phases && place_meeting(x, y + yVel, collisionList)) {
		steps = 0
		hitWall = true
		
	    while(!place_meeting(x, y + sign(yVel), collisionList)) {
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
