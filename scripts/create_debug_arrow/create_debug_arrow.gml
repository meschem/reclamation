///@description				Draws a debug arrow in a direction
///@param {real} _x
///@param {real} _y
///@param {real} _angle
function create_debug_arrow(_x, _y, _angle){
	var inst = instance_create_depth(_x, _y, depths.ui, obj_debug_vis)
	
	inst.sprite_index = spr_debug_arrow
	inst.image_angle = _angle
}