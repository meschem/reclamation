
age++

if (!shuffled && array_length(lootDrops) != 0) {
    lootDrops = array_shuffle(lootDrops)
}

if (age % dropRate == 0) {
    if (array_length(lootDrops) == 0) {
        instance_destroy()
    } else {
        create_toaster("Spawning drop")
        var _drop = array_pop(lootDrops)
        _drop.spawnDrop(player)    
    }
}

if (age > stf(60)) {
    create_toaster("obj_lob_drop_spawner older than 60s, destroying automatically", errorLevels.warning)
    
    instance_destroy()
}
