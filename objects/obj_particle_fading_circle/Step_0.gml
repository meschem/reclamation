age++

var _ageRatio = age / lifeSpan
var _alphaDiff = alphaStart - alphaEnd

alpha = alphaStart - (_ageRatio * _alphaDiff)

var _scale = _ageRatio * (scaleEnd - scaleStart)
scale += _scale

if (age >= lifeSpan)
	instance_destroy()