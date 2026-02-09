///@description   Description
///@param {asset.GMObject} _proj
///@param {real} _angle
///@param {real} _mag					Set -1 to ignore and use projectile props
///@param {real} _x
///@param {real} _y
///@param {id.Instance} _weapon
///@return {id.Instance}
function launch_projectile_player_weapon(_proj, _angle, _mag, _x, _y, _weapon) {
	var _inst = launch_projectile_from_point(_proj, _angle, _mag, _x, _y, _weapon.owner) // _weapon.owner)

	apply_player_weapon_projectile_props(_inst, _weapon)
	
	return _inst
}