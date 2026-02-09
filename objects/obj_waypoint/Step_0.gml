
if (game_is_paused()) {
	return 0
}

age++

openingPlayer = noone

if (state == enumWaypointStates.inactive) {
    image_index = 0
    
    with (obj_player) {
        if (
            x > other.x - other.activationRange &&
            x < other.x + other.activationRange &&
            y > other.y - other.activationRange &&
            y < other.y + other.activationRange
        ) {
            other.openingPlayer = id
        }
    }
    
    if (openingPlayer != noone) {
        activate()
    }
} else if (state == enumWaypointStates.ready) {
    with (obj_player) {
        if (
            x > other.x - other.useRange &&
            x < other.x + other.useRange &&
            y > other.y - other.useRange &&
            y < other.y + other.useRange
        ) {
            other.openingPlayer = id
        }
    }
    
    if (openingPlayer != noone) {
        var _pressingUse = get_input(bindActions.use)
        
        if (array_length(obj_room_controller.activeWaypoints) > 1) {
            image_index = 2
            
            if (_pressingUse) { 
                use()
            }
        } else {
            
        }
    } else {
        image_index = 1
    }
} else if (state == enumWaypointStates.sending) {
    stateAge++
    
    image_index = 2

    if (stateAge >= sendDuration) {
        sendPlayers()
        
    	state = enumWaypointStates.ready
    }
} else if (state == enumWaypointStates.receiving) {
    stateAge++
    
    image_index = 2
    
    if (stateAge >= receiveDuration) {
        enable_player_controls()
        
    	state = enumWaypointStates.ready
    }
}


