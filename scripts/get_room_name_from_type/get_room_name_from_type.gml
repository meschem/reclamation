///@description					Gives a player-readable name for a room type based on enum
///@param {real} _type			Type of enum roomTypes
///@return {string}
function get_room_name_from_type(_type) {
	switch (_type) {
		case roomTypes.normal:
			return "Normal"
			
		case roomTypes.boss:
			return "Boss"
			
		case roomTypes.brutal:
			return "Brutal"
			
		case roomTypes.elite:
			return "Elite"
			
		case roomTypes.horde:
			return "Horde"
			
		case roomTypes.intro:
			return "Intro"
			
		case roomTypes.heavy:
			return "Heavy"
			
		default:
			return "Undefined"
	}
}