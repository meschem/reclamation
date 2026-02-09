///@description							Builds a trail
///@param {real} _prevX					Previous X pos to calc
///@param {real} _prevY					Previous Y pos to calc
///@param {real} _x
///@param {real} _y
///@param {constant.Color} _color		
function trail_build(_prevX, _prevY, _x = x, _y = y) {
	var _trailLengthCur = array_length(trailSegments)
	
	var _startPos = new vec2(_x, _y)
	var _endPos = new vec2(_prevX, _prevY)

	var _segment = new trailSegment(
		_startPos,
		_endPos,
		3,
		3,
		trailColor
	)
	
	array_push(trailSegments, _segment)
	
	_trailLengthCur++
	
	// Cull if needed	
	if (_trailLengthCur > trailLength) {
		for (var i = 0; i < trailLength; i++) {
			trailSegments[i].startPos.x = trailSegments[i + 1].startPos.x
			trailSegments[i].startPos.y = trailSegments[i + 1].startPos.y
			
			trailSegments[i].endPos.x = trailSegments[i + 1].endPos.x
			trailSegments[i].endPos.y = trailSegments[i + 1].endPos.y
		}
		
		array_pop(trailSegments)
		_trailLengthCur--
	}
	
	var _curWidth = trailSpawnWidth
	var _decrement = trailSpawnWidth / _trailLengthCur

	for (var i = _trailLengthCur - 1; i >= 0; i--) {
		trailSegments[i].startWidth = _curWidth
		_curWidth -= _decrement
		trailSegments[i].endWidth = _curWidth
	}
}