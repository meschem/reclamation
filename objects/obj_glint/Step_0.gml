if (game_is_paused()) {
	return 0
}

x += xVel
y += yVel

starAngle += starRotationSpeed

if (instance_exists(target)) {
    var _targetDir = point_direction(0, 0, target.xVel, target.yVel)
    var _distToTarget = point_distance(x, y, target.x, target.y)
    var _mag = point_distance(0, 0, xVel, yVel)
    var _timeToTarget = _distToTarget / _mag
    
    var _targetX = lengthdir_x(target.moveSpeed, _targetDir * _timeToTarget)
    var _targetY = lengthdir_y(target.moveSpeed, _targetDir * _timeToTarget)
    
    var _dir = point_direction(x, y, target.x + _targetX, target.y + _targetY);
    var _targetXVel = lengthdir_x(maxSpeed, _dir);
    var _targetYVel = lengthdir_y(maxSpeed, _dir);

    xVel = lerp(xVel, _targetXVel, accel);
    yVel = lerp(yVel, _targetYVel, accel);

    if (point_distance(x, y, target.x, target.y) < 24) {
        obj_player.xp += pickupValue * get_player_stat(enumPlayerStats.pickupRewardScalar, target)
        onPickup(target)
        check_for_level_up()
        instance_destroy()
    }
}
