///@description   Description
function setup_level_a() {
	spawner.addPhase([
		spawner.setupSpawn(obj_skeleton, 6),
	])

	spawner.addPhase([
		spawner.setupSpawn(obj_skeleton, 6),
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
		spawner.setupSpawn(obj_burning_skeleton, 2),
		spawner.setupSpawn(obj_skeleton_warrior, 1),
		spawner.setupSpawn(obj_zombie, 4),
	])

	spawner.addPhase([
		spawner.setupSpawn(obj_wraith, 12, 2)
	])
}