///@description	Init
xVel = 0
yVel = 0

homesOnPlayer = true
homingActive = false
homingRadius = 40
homingAccel = 0.2

partitioned = false

distanceToTarget = 0
angleToTarget = 0

floatOffset = 0
reflectOffsetY = 10

flashBlendDuration = 0		// fades from white to base color over X frames, 0 is no blend
flashBlendRatio = 1

spawning = false			// used for lob or other instances handling a delayed spawn

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

///@description						Spawns the instance at the location
///@param {real} _x
///@param {real} _y
spawn = function(_x, _y) {
	image_alpha = true
	spawning = false
	x = _x
	y = _y
}
