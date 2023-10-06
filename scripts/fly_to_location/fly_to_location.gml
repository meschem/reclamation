///@description				Flies a baddie to a location
///@param {real} xVel
///@param {real} yVel
function fly_to_location(xVel, yVel) {
	var hitWall = false;

	if (!phases && place_meeting(x + xVel, y, obj_solid)) {
		hitWall = true;
		
	    while(!place_meeting(x + sign(xVel), y, obj_solid)) {
	        x += sign(xVel)
	    }
	   
	    xVel = 0;
	} else {
		x += xVel;
	}
	
	if (!phases && place_meeting(x, y + yVel, obj_solid)) {
		hitWall = true;
		
	    while(!place_meeting(x, y + sign(yVel), obj_solid)) {
	        y += sign(yVel)
	    }
	   
	    yVel = 0;
	} else {
		y += yVel;
	}
	
	return hitWall
}