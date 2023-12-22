
if (focusObject == noone)
	return 0
	
var xOffset = 0
var yOffset = 0
	
if (shakeForce > 0) {
	var r = shakeForce * sqrt(random(1))
	var theta = random(1) * 2 * pi
	
	xOffset = r * cos(theta)
	yOffset = r * sin(theta)
	
	shakeForce -= max(shakeDecay, 0)
}
	
center_view(focusObject, xOffset, yOffset)
