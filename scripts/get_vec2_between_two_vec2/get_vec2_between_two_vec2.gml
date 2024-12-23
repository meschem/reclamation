///@description					Gets a point between 2 vec2s at percent from A to B
///@param {struct.vec2} _vecA	Starting vector
///@param {struct.vec2} _vecB	Ending vector
///@param {real} _ratio			Ratio from A to B
///@return {struct.vec2}
function get_vec2_between_two_vec2(_vecA, _vecB, _ratio){
	var _x = _vecA.x + (_vecB.x - _vecA.x) * _ratio
    var _y = _vecA.y + (_vecB.y - _vecA.y) * _ratio
	
	var _vecC = new vec2(_x, _y)
	
	return _vecC
}
