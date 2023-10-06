nextLevel = rm_combat_testing_b

//setup_spawner(obj_zombie, 0, 40, 360)

spawner = create_instance(obj_spawner_controller)

spawner.addPhase([
	spawner.setupSpawn(obj_skeleton, 4),
])

spawner.addPhase([
	spawner.setupSpawn(obj_skeleton, 5),
	spawner.setupSpawn(obj_zombie, 1)
])

spawner.addPhase([
	spawner.setupSpawn(obj_skeleton, 4),
	spawner.setupSpawn(obj_zombie, 2),
	spawner.setupSpawn(obj_wraith, 2, 2),
	spawner.setupEliteSpawn(obj_skeleton)
])

spawner.addPhase([
	spawner.setupSpawn(obj_skeleton, 60, 1)
])

spawner.addPhase([
	spawner.setupSpawn(obj_burning_skeleton, 4),
	spawner.setupSpawn(obj_skeleton_warrior, 2),
	spawner.setupSpawn(obj_zombie, 2),
])

spawner.addPhase([
	spawner.setupEliteSpawn(obj_wraith),
	spawner.setupSpawn(obj_skeleton, 4),
	spawner.setupSpawn(obj_skeleton_warrior, 1),
])

spawner.addPhase([
	spawner.setupSpawn(obj_skeleton, 6),
	spawner.setupSpawn(obj_skeleton_warrior, 1),
])

spawner.addPhase([
	spawner.setupSpawn(obj_skeleton, 6),
	spawner.setupSpawn(obj_skeleton_warrior, 4),
	spawner.setupBossSpawn(obj_skeleton),
])


//setup_spawner(obj_skeleton, 0, 2)
//setup_spawner(obj_skeleton, 1, 6)
//setup_spawner(obj_skeleton, 2, 9)
//setup_spawner(obj_skeleton, 3, 6)
//setup_spawner(obj_burning_skeleton, 3, 6)
//setup_spawner(obj_zombie, 4, 8)
//setup_spawner(obj_skeleton_warrior, 4, 1)
//setup_spawner(obj_skeleton, 5, 30, 480)
//setup_spawner(obj_skeleton_warrior, 6, 12)
//setup_spawner(obj_skeleton, 7, 4)
//setup_spawner(obj_skeleton_warrior, 7, 3)
//setup_spawner(obj_wraith, 7, 4)
//setup_spawner(obj_greater_serpent, 8, 1, 9999)
//setup_spawner(obj_wraith, 8, 2)
//setup_spawner(obj_skeleton, 8, 12)

//spawner.add_enemy_type(obj_burning_skeleton)

//setup_spawner(obj_skeleton, 2, 6)
//setup_spawner(obj_skeleton_warrior, 2, 1, 600)

//spawner = setup_spawner(obj_skeleton, 3)
//spawner.add_enemy_type(obj_skeleton)
//spawner.add_enemy_type(obj_burning_skeleton)

//setup_spawner(obj_skeleton_warrior, 4, 4)
//setup_spawner(obj_skeleton_warrior, 5, 6)
//setup_spawner(obj_skeleton_warrior, 6, 8)
