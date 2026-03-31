
event_inherited()

name = "Lit Crit"
description = "Sends out a bolt of chain lightning on critical hits"

damage = 20
bounces = 5

upgradeType = weaponUpgradeTypes.major

stats = [
	new abilityStat(
		"Damage",
        "damage",
		damage
	),
	new abilityStat(
		"Bounces", "bounces",
		bounces
	)
]

addLifeCycleEvent(enumLifeCycleEvents.targetHit, function(_data) {
	if (!_data.critHit || !_data.projectile.mainProjectile) {
		return 0
	}
	
	var _inst
	var _owner = _data.owner
	var _target = _data.target
	
	_inst = instance_create_depth(_target.x, _target.y, depths.playerProjectile, obj_chain_lit_caster)
	
	_inst.owner = _owner
	_inst.spawnPoint = new vec2(_owner.x, _owner.y)
	_inst.bounces = bounces
	_inst.damage = damage
	_inst.lifeSpan = 1
})
