///@description						Applies shocked to a target
///@param {id.Instance} target		Target to apply shocked to
///@param {real} amount				Amount to apply
function apply_shocked(target, amount) {
	if (target.shockedLength < amount) {
		target.shockedLength = amount
	}	
}
