age++

var ageRatio = age / lifeSpan
var alphaDiff = alphaStart - alphaEnd

alpha = alphaStart - (ageRatio * alphaDiff)

if (age >= lifeSpan)
	instance_destroy()