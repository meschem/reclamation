///@description   Description
function setup_level_easy_skels() {
	spawner.addPhase([
		spawner.setupSpawn(obj_skeleton, 6),
	])

	spawner.addPhase([
		spawner.setupSpawn(obj_skeleton, 10),
		spawner.setupSpawn(obj_wraith, 2, 2)
	])
}