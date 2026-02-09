/// @description Insert description here
// You can write your code in this editor

if (abs(xVel) < xVelMax) {
	xVel += xAccel
}

// Inherit the parent event
event_inherited()

image_yscale = min(yScalar, ((age * yScalar) / 20))
