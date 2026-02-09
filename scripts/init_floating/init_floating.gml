/// @description				Sets up object for floating
/// @param {real} _floatRange	Distance in px to float up and down
/// @param {real} _phaseLength	Length of phase in frames

function init_floating(_floatRange = 2, _phaseLength = 60) {
	floats = true
	floatOffset = 0
	floatRange = _floatRange
	phaseLength = _phaseLength
	shadowScale = 1
}