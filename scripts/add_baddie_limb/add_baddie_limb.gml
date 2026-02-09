///@description						Adds a limb to a baddie
///@param {string} _name			Name for limb, used for struct var
///@param {asset.GMObject} _obj		Object to use for limb
///@param {struct.vec2} _offset		Offset from center
///@param {id.Instance} _owner		Owner of limb, defaults to caller
///@param {real} _depthOffset		Depth offset
function add_baddie_limb(_name, _obj, _offset, _owner = id, _depthOffset = -1) {
	var _limb = instance_create_depth(
		_owner.x + _offset.x,
		_owner.y + _offset.y,
		_owner.depth + _depthOffset,
		_obj
	)
	
	_limb.owner = _owner
	_limb.offset = _offset
	_limb.depthOffset = _depthOffset
	
	_owner.hasLimbs = true
	
	variable_struct_set(
		_owner.limbs,
		_name,
		_limb
	)
}
