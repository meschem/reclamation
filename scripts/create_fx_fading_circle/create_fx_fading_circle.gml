///@description							Creates a fading circle FX boom
///@param {real} xPos
///@param {real} yPos
///@param {real} radius
///@param {real} lifeSpan
///@param {color} hue
///@return {id.Instance}
function create_fx_fading_circle(xPos, yPos, radius, lifeSpan = 30, hue = c_white) {
	var inst = instance_create_depth(xPos, yPos, depths.fx, obj_particle_fading_circle)
	
	inst.radius = radius
	inst.lifeSpan = lifeSpan
	inst.hue = hue
	
	return inst
}