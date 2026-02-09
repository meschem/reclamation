///@description   Description
function setup_level_c() {
	spawner.addPhase([
		spawner.setupSpawn(obj_skeleton_warrior, 2),
		spawner.setupSpawn(obj_burning_skeleton, 1),
		spawner.setupSpawn(obj_skeleton, 3),
	])

	spawner.addPhase([
		spawner.setupSpawn(obj_skeleton_warrior, 2),
		spawner.setupSpawn(obj_skeleton, 6),
		spawner.setupSpawn(obj_fire_mage, 2, 2)
	])
	
	spawner.addPhase([
		spawner.setupSpawn(obj_wraith, 3),
		spawner.setupSpawn(obj_skeleton, 3),
		spawner.setupEliteSpawn(obj_skeleton)
	])
}
