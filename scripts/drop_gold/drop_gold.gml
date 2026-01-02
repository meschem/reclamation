///@description				Drops a chunk of gold from a baddie. Splits amount into item objects
///@param {real} amount		Amount of gold to drop
///@param {real} _x			X location
///@param {real} _y			Y location
function drop_gold(_amount, _x, _y) {
	var _spawnObject, _inst
	var _value = 0
	var _range = 0
	var _xOffset, _yOffset

	if (_amount <= 0) {
		return 0
	}

	while (_amount > 0) {
		if (_amount < 30) {
			_value = _amount
		} else {
			_value = min(irandom_range(6, 80), _amount)
		}
		
		_range = min((_amount / 2), 30)
		
		_xOffset = irandom_range(-_range, _range)
		_yOffset = irandom_range(-_range, _range)
        
        if (_value <= 8) {
            _spawnObject = obj_coin
        } else if (_value <= 24) {
            _spawnObject = obj_coin_stack_small
        } else if (_value <= 49) {
            _spawnObject = obj_coin_stack
        } else {
            _spawnObject = obj_coin_bar
        }
		
		//_spawnObject = (_value < 20) ? obj_coin : obj_coin_stack
		
		_inst = instance_create_depth(_x + _xOffset, _y + _yOffset, depths.enemy, _spawnObject)
		_inst.pickupValue = _value
		
		_amount -= _value
	}
}
