xVel = 0
yVel = 0

homesOnPlayer = true
homingActive = false
homingRadius = 40
homingAccel = 0.2

floatOffset = 0

/// FIXME: MULTIPLAYER

target = obj_player // get_player_target()

shadowSprite = spr_none
shadowOffset = 6

age = 0

lifeSpan = seconds_to_frames(8)

floats = false

///@param {id.Instance}	_player		Player picking up the item
onPickup = function(_player) {

}
