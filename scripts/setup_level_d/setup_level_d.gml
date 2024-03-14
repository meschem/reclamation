///@description   Description
function setup_level_d() {
	spawner.addPhase([
		spawner.setupSpawn(obj_slime_green, 6),
		spawner.setupSpawn(obj_poison_skeleton, 2),
	])

	spawner.addPhase([
		spawner.setupSpawn(obj_wraith, 8),
		spawner.setupSpawn(obj_slime_green, 3),
		spawner.setupSpawn(obj_slime_green_small, 6)
	])
}
