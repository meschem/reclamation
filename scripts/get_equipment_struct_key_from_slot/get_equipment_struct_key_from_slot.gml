///@description							Gets a struct key from enum for equipment slots
///@param {real} _slot					Uses enum equipmentSlots
///@return {string}						Struct key used for player
function get_equipment_struct_key_from_slot(_slot) {
	switch (_slot) {
		case equipmentSlots.boots:
			return "boots"
			
		case equipmentSlots.chest:
			return "chest"
			
		case equipmentSlots.gloves:
			return "gloves"
			
		case equipmentSlots.head:
			return "head"
			
		case equipmentSlots.neck:
			return "neck"
			
		case equipmentSlots.ringLeft:
			return "ringLeft"
			
		case equipmentSlots.ringRight:
			return "ringRight"
			
		case equipmentSlots.trinket:
			return "trinket"
	
		case equipmentSlots.weapon:
			return "weapon"
	}
}
