
event_inherited()

name = "Lit Crit"
description = "Sent out a bolt of chain lightning on critical hits"
active = false

enable()

addLifeCycleEvent(enumLifeCycleEvents.criticalHit, function(_target) {
	var _inst instance_create_depth(_target.x, _target.y, depths.playerProjectile, obj_chain_lit_bolt_warhammer)
	
	_inst.owner = owner
	_inst.spawnPoint = new vec2(x, y)
})
