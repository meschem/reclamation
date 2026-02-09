///@description                     Returns whether or not the player is using the mouse
///@return {bool}
function player_is_using_mouse() {
    with (obj_input_controller) {
        if (usingMouse) {
            return true
        }
    }
    
    return false
}