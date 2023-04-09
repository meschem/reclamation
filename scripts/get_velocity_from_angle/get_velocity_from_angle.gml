// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_velocity_from_angle(angle, mag){
	var xVel = cos(degtorad(angle)) * mag
	var yVel = sin(degtorad(angle)) * -mag

	return [xVel, yVel]
}