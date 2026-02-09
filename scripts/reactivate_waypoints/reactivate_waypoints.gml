///@description                 Reactivates waypoints on map load that have already been unlocked on a run
function reactivate_waypoints() {
    with (obj_run_controller) {
        for (var i = 0; i < array_length(unlockedWaypoints); i++) {
            var _waypointNameCheck = unlockedWaypoints[i]
            
            with (obj_waypoint) {
                if (waypointName == _waypointNameCheck) {
                    activate()
                }
            }
        }
    }
}
