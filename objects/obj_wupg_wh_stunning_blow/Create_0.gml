
event_inherited()

name = "Stunning Blow"
description = "Stuns targets if they're hit at full health."

stunLength = 1

upgradeType = weaponUpgradeTypes.major

stats = [
	new abilityStat(
		"Stun Length", "stunLength",
		[1, 1.5, 2], true, statUnits.seconds
	)
]

addLifeCycleEvent(enumLifeCycleEvents.targetHit, function(_data) {
	var _target = _data.target
	
	if (_target.hp == _target.hpMax) {
		stun_baddie(_target, stunLength)
	}
})
