/// @description Insert description here
// You can write your code in this editor

xVel = 0
yVel = 0

///@description			Gets the velocity of the object
///return {real}		
getVelocity = function () {
	return point_distance(0, 0, xVel, yVel)
}

///@description			Gets the current angle the object is moving
///return {real}
getMovingAngle = function () {
	return point_direction(0, 0, xVel, yVel)
}
