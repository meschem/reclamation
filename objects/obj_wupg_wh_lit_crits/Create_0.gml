
event_inherited()

name = "Lit Crit"
description = "Sent out a bolt of chain lightning on critical hits"

enable()

addLifeCycleEvent(enumLifeCycleEvents.targetHit, function(_data) {
	if (!_data.critHit) {
		return 0
	}
	
	var _inst
	var _owner = _data.owner
	var _target = _data.target
	
	_inst = instance_create_depth(_target.x, _target.y, depths.playerProjectile, obj_chain_lit_bolt_warhammer)
	
	_inst.owner = _owner
	_inst.spawnPoint = new vec2(_owner.x, _owner.y)
})
