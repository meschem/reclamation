
event_inherited()

var _target = get_first_player()
var _count = 4
var _angleInit = 0

if (_target != noone) {
    _angleInit = point_direction(x, y, _target.x, _target.y)
}

for (var i = 0; i < _count; i++) {
    var _inst = instance_create_depth(x, y, depths.enemyProjectile, obj_enemy_red_shot)
    var _mag = 1.25
    var _angle = _angleInit + ((360 / _count) * i)
    
    set_velocity_from_angle(_inst, _angle, _mag)
}
