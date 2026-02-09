///@description				Draws components from trail[] array
function trail_draw() {
	for (var i = 0; i < array_length(trailSegments); i++) {
		trailSegments[i].draw()
	}
}