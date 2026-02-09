timer--

age++

if (age == 1) {
	onAdd()
}

if (!permanent && timer <= 0) {
	instance_destroy()
}
