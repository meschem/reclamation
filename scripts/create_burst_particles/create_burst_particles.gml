///@description				Creates a burst of particles using the particle system
///@param {any} _part		Particle system to create
///@param {real} _x
///@param {real} _y
///@param {real} _angle
///@return {Id.ParticleSystem}
function create_burst_particles(_part, _x, _y, _angle) {
	var _pt = part_system_create_layer("Instances", false, _part)
	
	part_system_angle(_pt, _angle)
	part_system_position(_pt, _x, _y)
	part_system_depth(_pt, depths.fx)
	
	obj_particle_controller.addParticle(_pt)
	
	return _pt
}
