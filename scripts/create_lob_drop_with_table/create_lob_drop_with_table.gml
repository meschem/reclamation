///@description                             Creates a lob drop spawner using a type to create a table of drops
///@param {real} _x
///@param {real} _y
///@param {real} _dropType                  Type of drop that effectively converts a type to a percentage. Uses enumDropType.
///@param {id.Instance} _player             Player to drop items for
///@return {id.Instance}                    
function create_lob_drop_with_table(_x, _y, _dropType, _player = noone) {
    if (_player == noone) {
        _player = get_first_player()
    }
    
    var _spawner = instance_create_depth(_x, _y, depths.enemy, obj_lob_drop_spawner)
    
    _spawner.lootDrops = get_drop_table(_dropType)
    _spawner.player = _player
    
    return _spawner
}