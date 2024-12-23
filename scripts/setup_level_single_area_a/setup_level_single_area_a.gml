///@description   Description
function setup_level_single_area_a() {
	//1
	spawner.addPhase([
		setup_spawn(obj_skeleton)
	])
	
	//2
	spawner.addPhase([
		setup_spawn(obj_skeleton, 15),
		setup_spawn(obj_skeleton_warrior, 2),
		
	])

	//3
	spawner.addPhase([
		setup_spawn(obj_skeleton, 15),
		setup_spawn(obj_skeleton_warrior, 1),
		setup_spawn_unique(obj_u_rattlebones)
	])
	
	//4
	spawner.addPhase([
		setup_spawn(obj_skeleton, 15),
		setup_spawn(obj_burning_skeleton, 10)
	])
	
	//5
	spawner.addPhase([
		setup_spawn(obj_wraith, 4),
		setup_spawn(obj_skeleton_warrior, 4),
		setup_spawn(obj_skeleton, 25)
	])
	
	//6
	spawner.addPhase([
		setup_spawn(obj_zombie, 6),
		setup_spawn(obj_skeleton_warrior, 2),
		setup_spawn(obj_skeleton, 4),
		setup_spawn(obj_skeleton, 1, 1, spawnerTypes.elite)
	])
	
	//7
	spawner.addPhase([
		setup_spawn(obj_skeleton_warrior, 6),
		setup_spawn(obj_gold_skeleton_warrior, 1),
		setup_spawn(obj_zombie, 6),
	])
	
	//8
	spawner.addPhase([
		setup_spawn(obj_slime_green, 15, 16)
	])
	
	//9
	spawner.addPhase([
		setup_spawn(obj_slime_green, 1, 1, spawnerTypes.elite),
		setup_spawn(obj_slime_green, 20, 16)
	])
}
