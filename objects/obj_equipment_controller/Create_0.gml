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
	obj_gloves_fire_raisers,
	
	obj_head_leather_cap,
	obj_head_sallet,
	obj_head_tiara,
	obj_head_full_helm,
	
	obj_neck_silver_chain,
	obj_neck_rose_amulet,
	obj_neck_hungering_pendant,
]

for (var i = 0; i < array_length(validEquipment); i++) {
	array_push(templateEquipment, create_instance(validEquipment[i]))
}

///@description			Clears and resets templatized items from valid equipment list
resetTemplates = function() {
	for (var i = 0; i < array_length(templateEquipment); i++) {
		instance_destroy(templateEquipment[i])
	}
	
	templateEquipment = []
	
	for (var i = 0; i < array_length(validEquipment); i++) {
		array_push(templateEquipment, create_instance(validEquipment[i]))
	}
}

///@description							Gets an array of filtered items
///@param {real} _count					Amount of items to get
///@param {real} _rarityMultiplier		Rarity multiplier for better drops
///@return {array<id.Instance>}
getItemsByRolling = function(_count, _rarityMultiplier = 1) {
	var _equipment = array_shuffle(templateEquipment)
	var _selected = []
	var _rarity = enumRarity.any
	var _inst
	
	for (var i = 0; i < _count; i++) {
		_rarity = get_random_rarity()
		
		for (var i = 0; i < array_length(_equipment); i++) {
			if (_equipment[i].rarity == _rarity) {
				_inst = create_instance(_equipment[i].object_index)
				
				array_push(_selected, _inst)
				break
			}
			
			if (i == array_length) {
				create_toaster("Item not found of rarity", _rarity)
			}
		}
	}
	
	return _selected
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
