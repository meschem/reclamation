
event_inherited()

name = "Shockwave"
description = "Explodes in cone upon landing a hit, dealing a percentage of base damage. Improve by Weapon AOE."

damageScalar = 0.25

upgradeType = weaponUpgradeTypes.major

stats = [
	new abilityStat(
		"Damage Scale", "damageScalar",
		[0.25, 0.35, 0.5],
        true, statUnits.percent
	)
]

addLifeCycleEvent(enumLifeCycleEvents.targetHit, function(_data) {
	var _target = _data.target
    var _proj = _data.projectile
    var _dmg = _data.scaledDamage * damageScalar
    var _angle = get_angle(_proj.xVel, _proj.yVel)
    
	var _inst = activate_shockwave_wupg(_proj.owner, _dmg, _target.x, _target.y, _angle)
})
