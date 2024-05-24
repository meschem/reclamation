///@description						Gets a rarity string by enum
///@param {real} _rarity			enumRarity to check for
function get_rarity_string(_rarity) {
	switch (_rarity) {
		case enumRarity.normal: return "Common"
		case enumRarity.magic: return "Magic"
		case enumRarity.rare: return "Rare"
		case enumRarity.legendary: return "Legendary"
	}
}
