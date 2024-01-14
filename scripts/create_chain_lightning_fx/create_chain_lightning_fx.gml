///@description							Creates a lightning bolt connecting 2 points
///@param {struct.vec2}	sourcePoint
///@param {struct.vec2} targetPoint
///@param {real} lightningType			Type of lightning to create (visual only)

function create_chain_lightning_fx(sourcePoint, targetPoint, lightningType = 0) {
	if (lightningType == 0) {
		// do something...
	}
	
	var midPoint = get_vec2_midpoint(sourcePoint, targetPoint)
	var angle = point_direction(sourcePoint.x, sourcePoint.y, targetPoint.x, targetPoint.y)
	var distance = point_distance(sourcePoint.x, sourcePoint.y, targetPoint.x, targetPoint.y)
	
	// choose sprite based on distance?
	
	var sprite = spr_particle_lightning_medium
	var sprLength = 39
	var sprRotate = -2
	
	var inst = instance_create_depth(midPoint.x, midPoint.y, depths.fx, obj_particle_single_cycle)
	
	inst.sprite_index = sprite
	inst.image_angle = angle + sprRotate
	inst.image_xscale = distance / inst.sprite_width // sprite_get_width(sprite)
}