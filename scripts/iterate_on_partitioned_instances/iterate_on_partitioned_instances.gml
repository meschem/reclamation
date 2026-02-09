///@description                     Do thing to all partitioned objects
///@param {Any} _type               Type of object to temporarily activate with instance_activate_object(). Can be instance, object, or "all"
///@param {function} _callback      Callback function to run on instances
function iterate_on_partitioned_instances(_type, _callback) {
    with (obj_dormancy_controller) {
        iterateOnPartitionedInstances(_type, _callback)
    }
}
