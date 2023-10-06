///@description Controller

templateEquipment = []

validEquipment = [
	obj_boots_basic,
	obj_boots_stompers,
	obj_boots_steeled_toes,
	obj_boots_fleet_feet,
	
	obj_chest_aegis,
	obj_chest_leather,
	
	obj_gloves_leather,
	obj_gloves_fire_raisers
]

for (var i = 0; i < array_length(validEquipment); i++) {
	array_push(templateEquipment, create_instance(validEquipment[i]))
}

///@description					Gets an array of filtered items
///@param {real} count			Amount of items to get
///@param {struct} filter		Filter to apply. A struct of key and values.
///@return {array<Any>}
getFilteredItems = function(count, filter = {}) {
	var equipment = array_shuffle(templateEquipment)
	var selected = []
	
	for (var i = 0; i < array_length(templateEquipment); i++) {
		if (filter_instance(templateEquipment[i], filter)) {
			array_push(selected, templateEquipment[i])
			
			//show_message("Filter passed")
		} else {
			show_message("Filter failed")
		}
		
		//show_message(filter)
		//show_message(templateEquipment[i].name)
		
		if (array_length(selected) >= count) {
			i = 9999
		}
	}
	
	return selected
}

///@description						Creates a distinct item from a template
///@param {id.Instance} _item		Template to create item from
///@return {id.Instance}
createItemFromTemplate = function(_item) {
	var item = create_instance(_item.object_index)
	
	item.template = false
	
	return item
}
