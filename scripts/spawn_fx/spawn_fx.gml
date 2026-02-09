///@description						Spawn FX
///@param {real} _x					X position
///@param {real} _y					Y position
///@param {asset.GMSprite} _sprite	Sprite to use for the effect
///@param {real} _scale				Scale to apply to projectile
///@param {asset.GMObject} _object	Which particle to use. Defaults to single cycle sprite
///@return {id.Instance}
function spawn_fx(_x, _y, _sprite, _scale = 1, _object = obj_particle_single_cycle) {
	var _inst = instance_create_depth(_x, _y, depths.fx, _object)
	_inst.sprite_index = _sprite
	_inst.image_xscale = _scale
	_inst.image_yscale = _scale
	
	return _inst
}
