///@description								Creates a particle that's attached to a parent
///@param {asset.GMObject|array} _particle	Particle to spawn
///@param {id.Instance} _parent				Parent to attach the particle to
///@param {real} _offsetX					X offset
///@param {real} _offsetY					Y offset
///@return {id.Instance|array<id.Instance>}
function spawn_fx_attached(_particle, _parent, _offsetX = 0, _offsetY = 0) {
	if (is_array(_particle)) {
		var _insts = []
		
		for (var i = 0; i < array_length(_particle); i++) {
			var _inst = instance_create_depth(
				_parent.x + _offsetX,
				_parent.y + _offsetY,
				depths.fx,
				_particle[i]
			)
		
			_inst.parent = _parent
			_inst.offsetX = _offsetX
			_inst.offsetY = _offsetY
			
			array_push(_insts, _inst)
		}
		
		return _insts
	}
	
	var _inst = instance_create_depth(
		_parent.x + _offsetX,
		_parent.y + _offsetY,
		depths.fx,
		_particle
	)
	
	_inst.parent = _parent
	_inst.offsetX = _offsetX
	_inst.offsetY = _offsetY
		
	return _inst
}
