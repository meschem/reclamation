function store_main_room_map_instances() {
    with (obj_swarm_obelisk) {
        var _vars = []
        
        var _storedInst = new storedInstance(id, ["difficultyBoost"])
        
        array_push(obj_run_controller.storedInstances, _storedInst)
    }
    
    with (obj_merger_item_chest) {
        var _storedInst = new storedInstance(id)
        array_push(obj_run_controller.storedInstances, _storedInst)
    }
    
    with (obj_merger_item_chest_locked) {
        var _storedInst = new storedInstance(id)
        array_push(obj_run_controller.storedInstances, _storedInst)
    }
    
    with (obj_destructible) {
        var _storedInst = new storedInstance(id, ["hp"])
        array_push(obj_run_controller.storedInstances, _storedInst)
    }
}
