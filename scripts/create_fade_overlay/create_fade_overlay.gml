///@description                     Fades to and from a color
///@param {constant.Color} _color   Color to fade to and from
///@param {real} _delay             Frames to delay start of frade
///@param {real} _durationIn        Time to fade TO the requested color
///@param {real} _durationHold      Time to hold the color
///@param {real} _durationOut       Time to fade out
function create_fade_overlay(_color, _delay = 1, _durationIn = 60, _durationHold = 10, _durationOut = 60) {
    var _fader = create_instance(obj_full_overlay)
    
    _fader.fadeColor = _color
    _fader.waitingDuration = _delay
    _fader.fadeToColorDuration = _durationIn
    _fader.fadeHoldDuration = _durationHold
    _fader.fadeFromColorDuration = _durationOut
}
