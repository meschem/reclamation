///@description		Setup template trinkets

var inst

for (var i = 0; i < array_length(trinketObjects); i++) {
	inst = create_instance(trinketObjects[i])
	inst.makeTemplate()

	array_push(validTrinkets, inst)
}
