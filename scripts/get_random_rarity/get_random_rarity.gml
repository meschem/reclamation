///@description						Gets a random item rarity
///@param {real} _bonusMultiplier	Increases rarity of rare items. Not Used yet.
///@return {real}
function get_random_rarity(_bonusMultiplier = 1) {
	var _maxMultiplier = (1 / _bonusMultiplier)
	var _constant = 0.18
	
	if (random(1) < _constant * _maxMultiplier) {
		return enumRarity.normal
	}
	
	if (random(1) < _constant * _maxMultiplier) {
		return enumRarity.magic
	}
	
	if (random(1) < _constant * _maxMultiplier) {
		return enumRarity.rare
	}
	
	return enumRarity.legendary
}
