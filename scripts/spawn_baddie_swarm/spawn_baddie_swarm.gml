///@description						    Spawns baddies in a random location around the border
///@param {asset.GMObject} _baddie	    Enemy to spawn
///@param {real} _count				    Amount of enemies to spawn
///@param {real} _eventIndex	        Event index to use
///@param {id.Instance} _eventParent    Event instance to use
///@return {array<id.Instance>}
function spawn_baddie_swarm(_baddie, _count = 1, _eventIndex = 0, _eventParent = noone) {
	var _spawnDir = irandom(3)
	var _randomX = irandom_range(-20, room_width + 20)
	var _randomY = irandom_range(-20, room_height + 20)
	var _target = get_first_player()
    var _inst
	var _spawns = []
    
    for (var i = 0; i < _count; i++) {
        var zone = get_random_instance(obj_spawn_zone)
        var spawnX = irandom(zone.bbox_right - zone.bbox_left) / 2 + zone.x
	    var spawnY = irandom(zone.bbox_bottom - zone.bbox_top) / 2 + zone.y
        
        _inst = instance_create_depth(spawnX, spawnY, depths.enemy, _baddie)
        _inst.swarmIcon = spr_card_icons
        _inst.swarmIconIndex = _eventIndex
        _inst.eventParent = _eventParent
        
        array_push(_spawns, _inst)
    }
	
	apply_baddie_scaling(_spawns)

	return _spawns
}
