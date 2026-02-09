
age++

for(var i = 0; i < ds_list_size(particles); i++) {
	if (age >= particles[| i].destroyFrame) {
		//create_toaster($"{age}, {particles[| i].destroyFrame}, Particle sys removed")
		part_system_destroy(particles[| i].particle)
		ds_list_delete(particles, i)
	}
}
