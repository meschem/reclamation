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
			
		case roomTypes.shop:
			return "Shop"
		
		default:
			return "Undefined"
	}
}

function get_room_description_from_type(_type) {
	switch (_type) {
		case roomTypes.normal:
			return "Fight some baddies"
			
		case roomTypes.boss:
			return "Baddies and a boss"
			
		case roomTypes.brutal:
			return "Includes extra tough baddies"
			
		case roomTypes.elite:
			return "Fight against an elite enemy among the ruckus"
			
		case roomTypes.horde:
			return "Tons of dudes up in here"
			
		case roomTypes.intro:
			return "Easy room to start off with"
			
		case roomTypes.heavy:
			return "No weak baddies, but more tough ones"
			
		case roomTypes.shop:
			return "Buy some stuff here"
		
		default:
			return "Undefined"
	}
}