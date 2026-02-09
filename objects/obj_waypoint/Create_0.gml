/// @description Init

age = 0
mapIcon = spr_poi_waypoint

floats = false

name = "Waypoint"

//add_map_poi(id, spr_poi_waypoint_disabled)
mapIcon = spr_poi_waypoint_disabled

partitioned = false
sendReceiveDisableDuration = stf(2.5)
sendDuration = stf(1)
receiveDuration = stf(2.5)

useRange = 45
activationRange = 90

targetWaypoint = noone
canUse = false

stateAge = 0

enum enumWaypointStates {
    inactive,
    ready,
    sending,
    receiving
}

openingPlayer = noone
state = enumWaypointStates.inactive
index = 0

depth = depths.enemyFloorFx

///@description                             Activates a waypoint for the room. Must be re-activated on room load.
///@param {bool} _showAlert                 Alert the player that the waypoint has been unlocked
activate = function(_showAlert = true) {
    state = enumWaypointStates.ready
    
    obj_room_controller.addActiveWaypoint(id)
    
    remove_map_poi()
    add_map_poi(id, spr_poi_waypoint)
}

use = function() {
    var _target = noone
    
    for (var i = 0; i < array_length(obj_room_controller.activeWaypoints); i++) {
    	var _testWaypoint = obj_room_controller.activeWaypoints[i]
        
        if (_testWaypoint.index > index) {
        	_target = _testWaypoint
            break
        }
    }
    
    if (_target = noone) {
        _target = obj_room_controller.activeWaypoints[0]
    }
    
    targetWaypoint = _target
    targetWaypoint.state = enumWaypointStates.receiving
    targetWaypoint.stateAge = 0
    
    state = enumWaypointStates.sending
    stateAge = 0
    
    buff_player_invuln(2.2)
    disable_player_controls()
    create_fade_overlay(c_black, stf(0.15), stf(0.75), stf(0.5), stf(0.75))
}

sendPlayers = function() {
    with (obj_player) {
        x = other.targetWaypoint.x
        y = other.targetWaypoint.y
    }
}
