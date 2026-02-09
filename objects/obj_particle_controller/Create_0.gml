///@description								Init

particles = ds_list_create()

age = 0

///@description								Creates a particle to be managed
///@param {id.ParticleSystem} _part			Particle system to manage
///@param {real} _lifespan					Frames for particle to live
addParticle = function(_part, _lifespan = 300) {
	ds_list_add(particles, {
		particle: _part,
		destroyFrame: _lifespan + age
	})
}

roomCleanup = function() {
	for(var i = 0; i < ds_list_size(particles); i++) {
		part_system_destroy(particles[| i].particle)
	}
	
	ds_list_clear(particles)
}
