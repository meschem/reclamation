///@description   Sets floatRange for object. Requires age, phaseLength, floatRange to be set.

function set_float_range() {
	var phaseRatio = (age % phaseLength) / phaseLength
	var phase = sin(2 * pi * phaseRatio)
		
	floatOffset = phase * floatRange
	
	var _ratio = floatOffset / floatRange
	var _scalar = (_ratio * 0.1) + 1
	
	shadowScale = _scalar
}