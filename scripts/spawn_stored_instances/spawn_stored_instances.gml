///@description             Spawns stored instances for reloading the main room
function spawn_stored_instances() { 
    with (obj_run_controller) {
        for (var i = 0; i < array_length(storedInstances); i++) {
            storedInstances[i].spawn()
        }
        
        storedInstances = []
    }
}
