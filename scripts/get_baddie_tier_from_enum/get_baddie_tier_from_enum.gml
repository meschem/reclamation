// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_baddie_tier_from_enum(_tier) {
	switch (_tier) {
		case baddieTiers.boss: 
			return "Boss"
		
		case baddieTiers.large:
			return "Large"
			
		case baddieTiers.medium:
			return "Medium"
			
		case baddieTiers.pest:
			return "Pest"
			
		case baddieTiers.small:
			return "Small"
			
		case baddieTiers.very_large:
			return "Very Large"
			
		default:
			return "Bad enum call: " + string(_tier)
	}
}