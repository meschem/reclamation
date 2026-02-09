///@description					Gets the distance between to vec2s
///@param {struct.vec2} _vecA	Vector A
///@param {struct.vec2} _vecB	Vector B
///@return {real}
function get_vec2_distance(_vecA, _vecB){
	return point_distance(_vecA.x, _vecA.y, _vecB.x, _vecB.y)
}