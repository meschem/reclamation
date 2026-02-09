///@description                         Destroys all instances of type objectId
///@param {asset.GMObject} _objectId    Which object to limit
///@param {real} _maxAllowed            Maximum number allowed
///@param {bool} _processDestroyEvents  Whether or not to skip events in the instances Destroy event
function cull_instances(_objectId, _maxAllowed, _processDestroyEvents = false) {
    var _allInstances = []

    with (_objectId) {
        array_push(_allInstances, id)
    }
    
    var _currentCount = array_length(_allInstances)

    if (_currentCount > _maxAllowed) {
        _allInstances = array_shuffle(_allInstances)

        var _numberToDestroy = _currentCount - _maxAllowed
        
        repeat(_numberToDestroy) {
            var _instToDie = array_pop(_allInstances)
            instance_destroy(_instToDie, _processDestroyEvents)
        }
    }
}
