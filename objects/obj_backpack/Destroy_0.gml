/// @description Cleanup

show_message("destroying backpack")

for (var i = 0; i < array_length(slots); i++) {
	instance_destroy()
}

instance_destroy(itemInfoBox)
instance_destroy(mergerBox)
