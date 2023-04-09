///@description   Sets floatRange for object. Requires age, phaseLength, floatRange to be set.

function set_float_range() {
	var phaseRatio = (age % phaseLength) / phaseLength
	var phase = sin(2 * pi * phaseRatio)
		
	floatOffset = phase * floatRange
}