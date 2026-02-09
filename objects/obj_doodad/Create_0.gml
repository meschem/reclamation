///@description Init

depth = depths.player - y

partitioned = false

///@param {id.Instance} _inst		Instance colliding
onCollision = function(_inst) {}

///@description Returns if an object can be partitioned for dormancy
///@return {bool}
canPartition = function() {
    return true
}
