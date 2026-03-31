
event_inherited()

name = "Furious Swing"
description = "Swing with the might of a God, damaging units in an area in front of you"

damage = 12
knockback = 10

upgradeType = weaponUpgradeTypes.major

stats = [
	new abilityStat(
		"Damage",
        "",
		damage
	),
    new abilityStat(
		"Knockback",
        "",
		knockback,
        true,
        statUnits.none,
	),
]

onLevel = function() {
    owner = get_first_player()
    
    if (!instance_exists(owner)) {
        create_toaster("Onwer not found for Furious Swing", errorLevels.error)
        return 0
    }
    
    array_push(owner.onAttackAbilities, id)
}

activateOnAttack = function(_baseAttack) {
    var _player = get_first_player()

    var _mag = 1.3
    var _xNorm = get_angle_xvel(_player.attackAngle)
    var _yNorm = get_angle_yvel(_player.attackAngle)
    var _spawnDistance = 22
    
    var _swipe = instance_create_depth(_player.x + (_xNorm * _spawnDistance), _player.y + (_yNorm * _spawnDistance), depths.playerProjectile, obj_hammer_swipe)
    
    _swipe.owner = _player
    _swipe.xVel = _xNorm * _mag
    _swipe.yVel = _yNorm * _mag
    _swipe.image_angle = _player.attackAngle
    _swipe.damageDirect = damage
    _swipe.knockback = knockback
}