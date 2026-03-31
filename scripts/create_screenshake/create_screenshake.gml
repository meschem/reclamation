///@description						Applies screenshake
///@param {real} _amount			Amount to apply. Try using screenshake_ macros.
function create_screenshake(_amount = screenshake_med){
    with (obj_camera_controller) {
        applyShake(_amount)
    }
}