if (game_is_paused()) {
	return 0
}

x += xVel
y += yVel

starAngle += starRotationSpeed

if (instance_exists(target)) {
    // 1. Find the direction to the target
    var _dir = point_direction(x, y, target.x, target.y);
    
    // 2. Calculate "Desired" velocity (where we WANT to go)
    var _targetXVel = lengthdir_x(maxSpeed, _dir);
    var _targetYVel = lengthdir_y(maxSpeed, _dir);
    
    // 3. Gradually nudge current velocity toward desired velocity
    // This creates the "Bending" effect
    xVel = lerp(xVel, _targetXVel, accel);
    yVel = lerp(yVel, _targetYVel, accel);
    
    // 4. Guaranteed Collection: If very close, just snap to player
    if (point_distance(x, y, target.x, target.y) < 16) {
        obj_player.xp += pickupValue * get_player_stat(enumPlayerStats.pickupRewardScalar, target)
        onPickup(target)
        check_for_level_up()
        instance_destroy()
    }
}
