///@description   Returns x and y coordinates of an instance as a vec2
///@param {id.Instance} inst
///@return {struct.vec2}
function get_vec2_from_inst(inst) {
	return new vec2(inst.x, inst.y)
}