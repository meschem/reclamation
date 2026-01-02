
if (age > 0 && age % rate == 0) {
    // Set all partitions to inactive by default
    for (var i = 0; i < array_length(partitions); i++) {
        for (var j = 0; j < array_length(partitions[i]); j++) {
            partitions[i][j].active = false
        }
    }
    
    var _partitionedCount = 0
    
    // Go through all dormancy-managed objects and ...
    // 1. Add instances to partition they live in if "in play space" and "not partitioned"
    // 2. Deactivate instances if partitioned, will be activated conditionally later
    for (var i = 0; i < array_length(staticObjects); i++) {
        with (staticObjects[i]) {
            if (
                !partitioned && 
                x > 0 &&
                y > 0
            ) {
                other.setPartitionIndexFromLocation(id)
                _partitionedCount++
            }
            
            if (partitioned) {
                instance_deactivate_object(id)
            } 
        }
    }
    
    if (debug && _partitionedCount > 0) {
        create_toaster($"{_partitionedCount} instances partitioned")
    }
    
    
    // Get partitions around player
    var _player = get_first_player()
    var _pGridX = floor(_player.x / partitionWidth)
    var _pGridY = floor(_player.y / partitionHeight)

    // Set partition active state based on player position and
    // Activate instances in active partitions
    for (var _xOffset = -1; _xOffset <= 1; _xOffset++) {
        for (var _yOffset = -1; _yOffset <= 1; _yOffset++) {
            var _checkX = _pGridX + _xOffset
            var _checkY = _pGridY + _yOffset
            
            if (_checkX >= 0 && _checkX < array_length(partitions) && 
                _checkY >= 0 && _checkY < array_length(partitions[0])) {
                
                var _activePart = partitions[_checkX][_checkY]
                var _list = _activePart.instances
                
                _activePart.active = true

                for (var k = 0; k < array_length(_list); k++) {
                    instance_activate_object(_list[k])
                }
            }
        }
    }
}

age++
