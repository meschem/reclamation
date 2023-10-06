///@description   Description
///@param {real} rarity		enumRarity to check for
///@return {constant.Color}
function get_rarity_color(rarity){
	switch (rarity) {
		case enumRarity.normal:
			return get_color(colors.green)
		
		case enumRarity.magic:
			return get_color(colors.blue)
		
		case enumRarity.rare:
			return get_color(colors.purple)
		
		case enumRarity.legendary:
			return get_color(colors.red)
	}
	
	return get_color(colors.white)
}