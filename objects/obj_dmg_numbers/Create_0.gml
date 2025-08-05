
gravAccel = 0.08

xVel = 0
yVel = -1.4
yVelSign = sign(yVel)

age = 0
lifeSpan = 48
fadeOutStartFrame = 38 

valueSet = false
value = 0
digits = []
crit = false
sprite_index = spr_dmg_numbers

///@description				Sets value, must be done to do this
///@param {real} _amount	Amount to set value to
setValue = function(_amount, _crit = false) {
	valueSet = true
	value = _amount
	digits = convertDigits(_amount)
	crit = _crit
		
	if (crit) {		
		image_blend = get_color(colors.orange)
	}
}

/// @function get_digits(n)
/// @description Returns an array of digits from an integer, reversed
/// @param {real} n - the integer to break into digits
convertDigits = function(n) {
    var digits = []
    while (n > 0) {
        var digit = n mod 10
        array_push(digits, digit)
        n = n div 10
    }
    return digits
}
