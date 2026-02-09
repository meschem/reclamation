
enum enumOverlayStates {
    waiting,
    fadingTo,
    holding,
    fadingFrom,
}

depth = -1000

stateAge = 0

state = enumOverlayStates.waiting

fadeColor = c_black
fadeOpacity = 0
waitingDuration = 1
fadeToColorDuration = fts(1)
fadeHoldDuration = fts(0.1)
fadeFromColorDuration = fts(1)

height = view_height()
width = view_width()
