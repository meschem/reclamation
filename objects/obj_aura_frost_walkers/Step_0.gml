
// Inherit the parent event
event_inherited()

for (var i = 0; i < array_length(auraSpikes); i++) {
	var _spike = auraSpikes[i]
	
	_spike.angle += (rotationSpeed / 4)
	_spike.xPos = x + (angle_xvel(_spike.angle) * radius)
	_spike.yPos = y + (angle_yvel(_spike.angle) * radius)
}
