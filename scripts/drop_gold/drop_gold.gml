///@description				Drops a chunk of gold from a baddie. Splits amount into item objects
///@param {real} amount		Amount of gold to drop
///@param {real} _x			X location
///@param {real} _y			Y location
function drop_gold(amount, _x, _y) {
	var spawnObject

	if (amount <= 0) {
		return 0
	} else if (amount < 10) {
		spawnObject = obj_coin
	} else if (amount < 30) {
		spawnObject = obj_coin_stack
	} else {
		spawnObject = obj_coin_stack
	}

	_x += irandom_range(-5, 5)
	_y += irandom_range(-5, 5)
	
	var inst = instance_create_depth(_x, _y, depths.enemy, spawnObject)
	
	inst.pickupValue = amount
}
