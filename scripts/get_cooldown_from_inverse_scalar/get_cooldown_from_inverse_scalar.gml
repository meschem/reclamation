///@description					Gives a cooldown based on an increased rate of usage
///@param {real} cooldown		Base cooldown
///@param {real} scalar			Scalar to improve cooldown
///@return {real}

function get_cooldown_from_inverse_scalar(cooldown, scalar) {
	var updatedCooldown = cooldown * (1 / scalar)

	return updatedCooldown
}