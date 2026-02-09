/// @description Cleanup

//show_message("destroying backpack")

for (var i = 0; i < array_length(slots); i++) {
	//slots[i].backpack = noone
	instance_destroy(slots[i])
}

instance_destroy(itemInfoBox)
instance_destroy(mergerBox)
