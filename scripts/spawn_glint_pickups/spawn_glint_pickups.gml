///@description             Spawns a bunch of glint for the player
function spawn_glint_pickups(_x, _y, _amount, _player = noone) {
    if (_player == noone) {
        _player = get_first_player()
    }
    
    var _angle = point_direction(_player.x, _player.y, _x, _y)
    var _angleVariation = 15
    var _mag = 5
    var _magVariation = 2
    var _spawns = []
    
    while (_amount > 100) {
        var _inst = instance_create_depth(_x, _y, depths.enemy, obj_glint)
        var _instMag = _mag + random_range(-_magVariation, _magVariation)
        var _instAngle = _angle + random_range(-_angleVariation, _angleVariation)
        
        set_velocity_from_angle(_inst, _instAngle, _instMag)
        
        _inst.pickupValue = 100
        _inst.active = true
        _inst.homesOnPlayer = true
        _inst.homingActive = true
        _inst.target = _player
        
        _amount -= 100
    }
    
    while (_amount > 0) {
        var _value = max(20, _amount)
        var _inst = instance_create_depth(_x, _y, depths.enemy, obj_glint)
        var _instMag = _mag + random_range(-_magVariation, _magVariation) + 1
        var _instAngle = _angle + random_range(-_angleVariation, _angleVariation)
        
        set_velocity_from_angle(_inst, _instAngle, _instMag)
        
        _inst.pickupValue = _value
        _inst.active = true
        _inst.homesOnPlayer = true
        _inst.homingActive = true
        _inst.target = _player
        
        _amount -= _value
    }
}
