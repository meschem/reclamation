///@description				Rounds to a precise number of digits
///@param {real} _value		Value to round
///@param {real} _digits	Number of digits
///@return {real}
function round_ext(_value, _digits) {
	var _multiplier = power(10, _digits)
	
	return round(_value * _multiplier) / _multiplier
}

/*

14.254, 2

m = 10 ^ 2, 100

14.254 * 100 = 1425.4, round, 1425, 14.25

*/