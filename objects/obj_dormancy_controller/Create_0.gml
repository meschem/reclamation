///@description Init controller

partitionHeight = camera_get_view_height(view_camera[0])
partitionWidth = camera_get_view_width(view_camera[0])
//partitionsCreated = false

initialized = false
rate = stf(1)
age = 0
debug = false
force = false

staticObjects = [
    //obj_doodad,
    obj_destructible,
    obj_elite_obelisk,
    obj_pickup
]

dynamicObjects = [
    // NOT YET SETUP
]

var _cols = ceil(room_width / partitionWidth)
var _rows = ceil(room_height / partitionHeight)

partitions = array_create(_cols)

for (var i = 0; i < _cols; i++) {
    partitions[i] = array_create(_rows)
    
    for (var j = 0; j < _rows; j++) {
        var _x = i * partitionWidth
        var _y = j * partitionHeight
        
        partitions[i][j] = new spacePartition(_x, _y, i, j, partitionWidth, partitionHeight)
    }
}

///@description                     Setups up partition info for an instance
///@param {id.Instance} _inst       Instance to update              
setPartitionIndexFromLocation = function(_inst) {
    var _pGridX = floor(_inst.x / partitionWidth)
    var _pGridY = floor(_inst.y / partitionHeight)
    
    _pGridX = clamp(_pGridX, 0, array_length(partitions) - 1);
    _pGridY = clamp(_pGridY, 0, array_length(partitions[0]) - 1);
    
    partitions[_pGridX][_pGridY].addInstance(_inst)
}

///@description                     Do thing to all partitioned objects
///@param {Any} _type               Type of object to temporarily activate with instance_activate_object(). Can be instance, object, or "all"
///@param {function} _callback      Callback function to run on instances. Target instance must be specified
iterateOnPartitionedInstances = function(_type, _callback) {
    var _cols = array_length(partitions)
    var _rows = array_length(partitions[0])
    
    instance_activate_object(_type)
    force = true

    for (var i = 0; i < _cols; i++) {
        for (var j = 0; j < _rows; j++) {
            var _instList = partitions[i][j].instances
            var _count = array_length(_instList)
            
            for (var k = 0; k < _count; k++) {
                var _id = _instList[k];
                
                with (_id) {
                    _callback(_id)
                }
            }
        }
    }
}
