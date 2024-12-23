///@description			Controls mutators

mutators = [
	obj_mutator_infestation
]

for (var i = 0; i < array_length(mutators); i++) {
	create_instance(mutators[i])
}
