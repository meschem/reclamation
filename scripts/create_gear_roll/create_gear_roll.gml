///@description					Creates random pieces of gear. Does not allow for duplicates.
///@param {real} slot			Uses enum equipmentSlots. Defaults to random.
///@param {real} rarity			Uses enum enumRarity. Defaults to random.
///@param {real} count			Amount of items to get
///@return {array<id.Instance>}

function create_gear_roll(slot = -1, rarity = -1, count = 1) {
	var gear = []

	if (slot == -1) {
		var slotSelection = [
			equipmentSlots.boots,
			equipmentSlots.head,
			equipmentSlots.chest,
			equipmentSlots.gloves
		]
		
		slot = array_random(slotSelection)
	}
	
	if (rarity == -1) {
		var raritySelection = [
			enumRarity.normal,
			enumRarity.magic,
			enumRarity.rare,
			enumRarity.legendary
		]
		
		rarity = array_random(raritySelection)
	}
	
	var gearTemplates = obj_equipment_controller.getFilteredItems(count, {
		//rarity: rarity,
		//slot: slot
	})
	
	for (var i = 0; i < array_length(gearTemplates); i++) {
		array_push(gear, obj_equipment_controller.createItemFromTemplate(gearTemplates[i]))
	}
	
	return gear
}