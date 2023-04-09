/// @description Has an object try to move towards a location

function walk_to_location() {
	hitWall = false;

	
	
	if (!phases && place_meeting(x + xVel, y, obj_pit)) {
		hitWall = true;
		
	    while(!place_meeting(x + sign(xVel), y, obj_pit)) {
	        x += sign(xVel)
	    }
	   
	    xVel = 0
	} else if (!phases && place_meeting(x + xVel, y, obj_baddie)) {
		hitWall = true
		
	    while(!place_meeting(x + sign(xVel), y, obj_baddie)) {
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
	} else if (!phases && place_meeting(x, y + yVel, obj_baddie)) {
		hitWall = true
		
	    while(!place_meeting(x, y + sign(yVel), obj_baddie)) {
	        y += sign(yVel)
	    }
	   
	    yVel = 0
	} else {
		y += yVel;
	}
}