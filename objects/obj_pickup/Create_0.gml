xVel = 0
yVel = 0

homesOnPlayer = true
homingActive = false
homingRadius = 40
homingAccel = 0.2

distanceToTarget = 0
angleToTarget = 0

floatOffset = 0

/// FIXME: MULTIPLAYER

target = get_first_player() // get_player_target()

shadowSprite = spr_none
shadowOffset = 6

age = 0

lifeSpan = seconds_to_frames(8)

floats = false

active = false // can be picked up
pickupDelay = 20

drawLocatorArrow = false
arrowSprite = spr_locator_arrow
arrowDrawLocation = new vec2(0, 0)
arrowDrawAngle = 0
arrowDrawOffset = new vec2(0, -20)

beginStep = function() {}

///@param {id.Instance}	_player		Player picking up the item
onPickup = function(_player) {

}
