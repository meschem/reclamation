///@description						Creates an item orb drop somewhere
///@param {real} _x
///@param {real} _y
///@param {real} _rarityMultiplier	
///@param {array.real} _slots		Uses enum for equipmentSlots
///@return id.Instance
function create_random_item_drop(_x, _y, _rarityMultiplier = 1, _slots = []) {
	if (array_length(_slots) == 0) {
		_slots = [
			equipmentSlots.head,
			equipmentSlots.chest,
			equipmentSlots.gloves,
			equipmentSlots.boots
		]
	}
	
	//var _equipment = create_gear_roll(1, _rarityMultiplier, _slots)
	var _gear = obj_equipment_controller.getItemsByRolling(1, _rarityMultiplier, _slots)
	var _orb = instance_create_depth(_x, _y, depths.enemy, obj_equipment_globe_preset)
	
	_orb.attachEquipment(_gear[0])
	
	return _orb
}

///@description						Creates a merger item orb drop somewhere
///@param {real} _x
///@param {real} _y
///@return id.Instance
function create_random_merger_item_drop(_x, _y) {
	var _item = obj_merger_item_controller.createItem()	
	var _orb = instance_create_depth(_x, _y, depths.enemy, obj_equipment_globe_preset)
	
	_orb.isMergerItem = true
	_orb.attachEquipment(_item)
}

function create_random_item_drop_filtered(_location, _rarityMultiplier = 1, _filter = {}) {
	if (array_length(_slots) == 0) {
		_slots = [
			equipmentSlots.head,
			equipmentSlots.chest,
			equipmentSlots.gloves,
			equipmentSlots.boots
		]
	}
	
	var _equipment = create_gear_roll(1, _rarityMultiplier, _slots)
	var _orb = instance_create_depth(_location.x, _location.y, depths.enemy, obj_equipment_globe_preset)
}