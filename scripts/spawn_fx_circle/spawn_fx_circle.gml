/// @description		Spawns a circle FX
/// @param {real} radius
/// @param {real} lifeSpan
/// @param {bool} changeAlpha
/// @param {real} alphaStart
/// @return {Id.Instance}

function spawn_fx_circle(radius, lifeSpan = 32, changeAlpha = true, alphaStart = 0.33) {
	var inst = instance_create_depth(x, y, depths.fx, obj_particle)
	
	inst.changeAlpha = changeAlpha
	inst.alphaStart = alphaStart
	inst.image_alpha = alphaStart
	inst.sprite_index = spr_particle_solid_32_circle
	inst.image_xscale = (radius * 2) / 32
	inst.image_yscale = (radius * 2) / 32
	inst.lifeSpan = lifeSpan
	
	return inst
}