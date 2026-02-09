///@description   Description
function setup_level_e() {
	spawner.addPhase([
		spawner.setupSpawn(obj_skeleton, 1),
		spawner.setupSpawn(obj_zombie, 24),
	])

	spawner.addPhase([
		spawner.setupSpawn(obj_gold_skeleton_warrior, 1),
		spawner.setupSpawn(obj_skeleton_warrior, 4),
		spawner.setupSpawn(obj_wraith, 2)
	])
	
	spawner.setupSingleSpawn(obj_greater_serpent_green)
}
