///@description						Creates random pieces of gear. Does not allow for duplicates.
///@param {real} _count				Amount of items to get
///@param {real} _rarityMultiplier	Improves drop rarity by a %
///@return {array<id.Instance>}

function create_gear_roll(_count = 1, _rarityMultiplier = 0, _validSlots = []) {
	/*
		Equipment Filter example:
		{
			slot: [equipmentSlots.none],
			rarity: = [enumRarity.normal]
		}
	*/
	//if (slot == -1) {
	//	var slotSelection = [
	//		equipmentSlots.boots,
	//		equipmentSlots.head,
	//		equipmentSlots.chest,
	//		equipmentSlots.gloves
	//	]
		
	//	slot = array_random(slotSelection)
	//}
	
	//if (rarity == -1) {
	//	var raritySelection = [
	//		enumRarity.normal,
	//		enumRarity.magic,
	//		enumRarity.rare,
	//		enumRarity.legendary
	//	]
		
	//	rarity = array_random(raritySelection)
	//}
	
	//var gearTemplates = obj_equipment_controller.getFilteredItems(count, {
		//rarity: rarity,
		//slot: slot
	//})
	
	//for (var i = 0; i < array_length(gearTemplates); i++) {
	//	array_push(gear, obj_equipment_controller.createItemFromTemplate(gearTemplates[i]))
	//}
	
	var _gear = obj_equipment_controller.getItemsByRolling(_count, _rarityMultiplier, _validSlots)
	
	return _gear
}