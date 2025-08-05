if (game_is_paused()) {
	return 0
}

xVel = clamp(xVel + xAccel, -xVelMax, xVelMax)
x += xVel
age++

var _progress = clamp(age / lifeSpan, 0, 1)
var _curve = animcurve_get_channel(ac_pickup_equipment_vert_ray, "scale")
var _curveValue = animcurve_channel_evaluate(_curve, _progress)
var _finalScale = _curveValue * yScaleMax
image_yscale = _finalScale

if (age > lifeSpan) {
	instance_destroy()
}