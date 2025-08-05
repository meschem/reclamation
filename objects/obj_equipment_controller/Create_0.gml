///@description Controller

enum equipmentFilter {
	minRarity,
	maxRarity,
	slotList
}

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

///@description						Returns true or false if item is in slot list
///@param {id.Instance} _equipment	Instance of equipment to check
///@param {array} _slots			Slots to filter from
///@return {bool}
validSlot = function(_equipment, _slots) {
	if (array_length(_slots) == 0) {
		return true
	}

	for (var i = 0; i < array_length(_slots); i++) {
		if (_equipment.slot == _slots[i]) {
			return true
		}
	}
	
	return false
}

///@description							Gets an array of filtered items
///@param {real} _count					Amount of items to get
///@param {real} _rarityMultiplier		Rarity multiplier for better drops
///@param {array} _validSlots			If not empty, limits to equipment slots
///@return {array<id.Instance>}
getItemsByRolling = function(_count, _rarityMultiplier = 1, _validSlots = []) {
	//var _filteredEquipment = getFilteredItems(_count, _filter)
	var _equipment = array_shuffle(templateEquipment)
	var _selected = []
	var _rarity = enumRarity.any
	var _inst
	
	for (var i = 0; i < _count; i++) {
		_rarity = get_random_rarity(_rarityMultiplier)
		
		for (var j = 0; j < array_length(_equipment); j++) {
			if (
				_equipment[j].rarity == _rarity &&
				validSlot(_equipment[j], _validSlots)
			) {
				_inst = create_instance(_equipment[j].object_index)
				_inst.template = false
				
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
///@return {array<id.Instance>}
getFilteredItems = function(count, filter = {}) {
	var equipment = array_shuffle(templateEquipment)
	var selected = []
	
	for (var i = 0; i < array_length(templateEquipment); i++) {
		if (filter_instance(templateEquipment[i], filter)) {
			array_push(selected, templateEquipment[i])
			
			show_message("Filter passed")
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

///@description						Creates items via roll using a filter
///@param {real} count				Amount of items to create
///@param {real} _rarityMultiplier	Magic find / rarity mult
///@param {struct} filter			Filter for items using minRarity, maxRarity, slotList
getItemsByFilter = function(count, _rarityMultiplier = 1, filter = {}) {
	var _equipment = array_shuffle(templateEquipment)
	var _selected = []
	var _validSlots = []
	var _rarity = get_random_rarity()
	var _inst
	
	if (variable_struct_exists(filter, "minRarity")) {
		_rarity = max(filter.minRarity, _rarity)
	}
	
	if (variable_struct_exists(filter, "maxRarity")) {
		_rarity = min(filter.maxRarity, _rarity)
	}
	
	if (variable_struct_exists(filter, "slotList")) {
		_validSlots = filter.slotList
	}
	
	for (var i = 0; i < _count; i++) {
		for (var j = 0; j < array_length(_equipment); j++) {
			if (
				_equipment[j].rarity == _rarity &&
				validSlot(_equipment[j], _validSlots)
			) {
				_inst = create_instance(_equipment[j].object_index)
				_inst.template = false
				
				array_push(_selected, _inst)
				break
			}
						
			if (i == array_length) {
				show_message("No item found to drop from filter...")
				show_message(filter)
			}
		}
	}
	
	return _selected
}

///@description						Creates a distinct item from a template
///@param {id.Instance} _item		Template to create item from
///@return {id.Instance}
createItemFromTemplate = function(_item) {
	var item = create_instance(_item.object_index)
	
	item.template = false
	
	return item
}
