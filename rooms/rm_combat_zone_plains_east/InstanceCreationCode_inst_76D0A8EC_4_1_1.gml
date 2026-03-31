
category = roomCategories.combatSingle
setup_level_single_area_a()

if (instance_number(obj_map) == 0) {
    create_toaster("Creating Map")
    var _inst = create_instance(obj_map)
    _inst.sprite_index = spr_minimap_plains_east
}

chestSpawnRange = {
	xMin: 820,
	xMax: 5460,
	yMin: 490,
	yMax: 4240
}
