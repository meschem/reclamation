///@description						Scales velocity to an amount for any object with xVel and yVel.							
///@param {Id.Instance} object		Any object that uses xVel and yVel
///@param {real} scalar				Scalar to multiply it by

function velocity_multiply(object, scalar) {
	object.xVel *= scalar
	object.yVel *= scalar
}