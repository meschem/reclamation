/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

reflectOffsetY = 24

shadowSprite = spr_shadow_med
shadowOffset = 6

lifeSpan = -1

init_floating(2, 90)

onPickup = function() {
    with (obj_pickup) {
        if (object_index == obj_coin || object_is_ancestor(object_index, obj_coin)) {
            fullMagnetize = true
            homingActive = true
            partitioned = false
            ignorePartitioning = true    
        }
    }
    
    iterate_on_partitioned_instances(obj_pickup, function(_partitionedInstance) {
        with (_partitionedInstance) {
            if (object_index == obj_coin || object_is_ancestor(object_index, obj_coin)) {
                fullMagnetize = true
                homingActive = true
                partitioned = false
                ignorePartitioning = true
            }
        }
    })
    
    instance_destroy()
}
