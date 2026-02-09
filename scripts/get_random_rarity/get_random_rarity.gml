///@description						Gets a random item rarity
///@param {real} _magicFind			Magic find to apply
///@param {real} _minRarity         Minimum rarity of the item
///@return {real}
function get_random_rarity(_magicFind = 0, _minRarity = enumRarity.any) {
    if (_minRarity == enumRarity.any) {
        _minRarity = enumRarity.normal
    }
    
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
	var _sumOfWeights = 0
	
	// 1. Calculate boosted weights for eligible rarities
    for (var i = 0; i < _rarityCount; i++) {
        if (i < _minRarity) continue;

        var _boostFactor = 1 + (_magicFind / 100) * _multipliers[i]
        var _weight = _baseWeights[i] * _boostFactor
        
        _adjustedWeights[i] = _weight
        _sumOfWeights += _weight
    }
    
    // Safety check: If the total weight is 0, return the minimum rarity
    if (_sumOfWeights <= 0) return _minRarity

    // 2. Roll against the sum of the remaining weights
    var _roll = random(_sumOfWeights)
    var _cursor = 0
    
    for (var i = 0; i < _rarityCount; i++) {
        if (_adjustedWeights[i] > 0) {
            _cursor += _adjustedWeights[i]
            if (_roll <= _cursor) {
                return i
            }
        }
    }
    
    return _minRarity
}
