/// @description Cleanup

//show_message("destroying backpack")

for (var i = 0; i < array_length(slots); i++) {
	instance_destroy(slots[i])
}

if (instance_exists(selector)) {
	instance_destroy(selector)
}

if (instance_exists(infobox)) {
	instance_destroy(infobox)
}
