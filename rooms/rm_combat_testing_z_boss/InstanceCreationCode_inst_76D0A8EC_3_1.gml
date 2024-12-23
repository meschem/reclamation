//nextLevel = rm_combat_testing_b

//setup_level_busy()

//spawner.addPhase([
//	spawner.setupFlybySpawn(obj_devil, false, 3),
//])

cameraOffset.y = -3

set_spawner_phase_length(10)

setup_spawner_endless(obj_skeleton)
setup_spawner_endless(obj_skeleton_warrior, 1, 1, 4)
