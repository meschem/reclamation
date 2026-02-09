if (state == enumOverlayStates.waiting) {
    if (stateAge > waitingDuration) {
        state = enumOverlayStates.fadingTo
        stateAge = 0
    }
} else if (state == enumOverlayStates.fadingTo) {
    fadeOpacity = stateAge / fadeToColorDuration
    
    if (stateAge > fadeToColorDuration) {
        state = enumOverlayStates.holding
        stateAge = 0
    } 
} else if (state == enumOverlayStates.holding) {
    fadeOpacity = 1
    
    if (stateAge > fadeHoldDuration) {
        state = enumOverlayStates.fadingFrom
        stateAge = 0
    }
} else if (state == enumOverlayStates.fadingFrom) {
    fadeOpacity = 1 - (stateAge / fadeFromColorDuration)
    
    if (stateAge > fadeFromColorDuration) {
        instance_destroy()
    }
}

stateAge++