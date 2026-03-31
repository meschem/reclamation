if (state == enumOverlayStates.waiting) {
    if (stateAge > waitingDuration) {
        state = enumOverlayStates.fadingTo
        stateAge = 0
    }
} else if (state == enumOverlayStates.fadingTo) {
    fadeOpacity = stateAge / fadeToColorDuration
    fadeOpacity *= opacityScalar
    
    if (stateAge > fadeToColorDuration) {
        state = enumOverlayStates.holding
        stateAge = 0
    } 
} else if (state == enumOverlayStates.holding) {
    fadeOpacity = 1
    fadeOpacity *= opacityScalar
    
    if (stateAge > fadeHoldDuration) {
        state = enumOverlayStates.fadingFrom
        stateAge = 0
    }
} else if (state == enumOverlayStates.fadingFrom) {
    fadeOpacity = 1 - (stateAge / fadeFromColorDuration)
    fadeOpacity *= opacityScalar
    
    if (stateAge > fadeFromColorDuration) {
        instance_destroy()
    }
}

stateAge++