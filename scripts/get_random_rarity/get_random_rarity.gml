///@description						Gets a random item rarity
///@param {real} _magicFind			Magic find to apply
///@return {real}
function get_random_rarity(_magicFind = 0) {
	var _baseWeights = [
		0.82,	// normal
		0.1,	// magic
		0.055,	// rare
		0.025,	// legendary
	]
	
	var _multipliers = [
		0.0,
		0.5,
		1.0,
		2.0
	]
	
	var _rarityCount = 4
	
	var _adjustedWeights = []
	var _sumOfAdjustedWeights = 0
	
	for (var _rarityEnum = 0; _rarityEnum < _rarityCount; _rarityEnum++) {
		var _baseWeight = _baseWeights[_rarityEnum]
		var _multiplier = _multipliers[_rarityEnum]
		var _boostFactor = 1 + (_magicFind / 100) * _multiplier
		var _newWeight = _baseWeight * _boostFactor
		
		_adjustedWeights[_rarityEnum] = _newWeight
		_sumOfAdjustedWeights += _newWeight
	}
	
	var _normalizedWeights = []
	var _cumulativeProbability = 0
	
	for (var _rarityEnum = 0; _rarityEnum < _rarityCount; _rarityEnum++) {
        var _normalized = _adjustedWeights[_rarityEnum] / _sumOfAdjustedWeights;
        
        // Use a cumulative probability for the weighted random roll
        _cumulativeProbability += _normalized;
        _normalizedWeights[_rarityEnum] = _cumulativeProbability;
    }
	
	var _roll = random(1)
	
	for (var _rarityEnum = 0; _rarityEnum < _rarityCount; _rarityEnum++) {
		if (_roll < _normalizedWeights[_rarityEnum]) {
			return _rarityEnum
		}
	}
	
	return enumRarity.normal
}
