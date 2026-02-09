///@description   Description
function setup_level_b() {
	spawner.addPhase([
		spawner.setupSpawn(obj_skeleton, 4),
		spawner.setupSpawn(obj_poison_skeleton, 4),
	])

	spawner.addPhase([
		spawner.setupSpawn(obj_skeleton, 18, 2),
		spawner.setupSpawn(obj_skeleton_warrior, 1)
	])
}
