///@description   Description
function setup_level_single_area_a() {
	//1
	spawner.addPhase([
		setup_spawn(obj_skeleton, 6)
	])
	
	//2
	spawner.addPhase([
		setup_spawn(obj_skeleton, 8),
		setup_spawn(obj_skeleton_warrior, 2),
	])

	//3
	spawner.addPhase([
		setup_spawn(obj_skeleton, 10),
		setup_spawn(obj_skeleton_warrior, 2)
	])
	
	//4
	spawner.addPhase([
		setup_spawn(obj_skeleton, 6),
		setup_spawn_unique(obj_u_rattlebones),
		setup_spawn(obj_boarrior, 4)
	])
	
	//5
	spawner.addPhase([
		setup_spawn(obj_zombie, 6),
	])
	
	//6
	spawner.addPhase([
		setup_spawn(obj_zombie, 4),
		setup_spawn(obj_skeleton_warrior, 2),
		setup_spawn(obj_skeleton, 2),
	])
	
	//7
	spawner.addPhase([
		setup_spawn(obj_zombie, 8)
	])
	
	//8
	spawner.addPhase([
		setup_spawn(obj_zombie, 4),
		setup_spawn(obj_devil, 15, spawnWvs, spawnerTypes.flybyChargeCluster)
	])
	
	//7
	spawner.addPhase([
		setup_spawn(obj_zombie, 4),
		setup_spawn(obj_zombie_huge, 2)
	])
	
	//8
	spawner.addPhase([
		setup_spawn(obj_zombie, 6),
		setup_spawn(obj_devil, 15, spawnWvs, spawnerTypes.flybyChargeCluster)
	])
	
	//9
	spawner.addPhase([
		setup_spawn(obj_slime_green, 12, 16)
	])
	
	//10
	spawner.addPhase([
		setup_spawn(obj_slime_green, 1, 1, spawnerTypes.elite),
		setup_spawn(obj_slime_green, 12, 16)
	])
	
	//11
	spawner.addPhase([
		setup_spawn(obj_wraith, 4),
		setup_spawn(obj_big_wizard, 2)
	])
	
	//12
	spawner.addPhase([
		setup_spawn(obj_skeleton_warrior, 4),
		setup_spawn(obj_skeleton_champion, 2)
	])
	
	//13
	spawner.addPhase([
		setup_spawn(obj_skeleton_champion, 1, 1, spawnerTypes.elite),
		setup_spawn(obj_poison_skeleton, 6)
	])
	
	//14
	spawner.addPhase([
		setup_spawn(obj_skull_head_frozen, 6),
		setup_spawn(obj_skeleton_warrior, 3),
		setup_spawn_unique(obj_u_abaddon)
	])
	
	//14
	spawner.addPhase([
		setup_spawn(obj_skull_head_frozen, 7),
		setup_spawn(obj_skeleton_warrior, 2),
	])
	
	//15
	spawner.addPhase([
		setup_spawn(obj_zombie_elite, 8),
		setup_spawn(obj_iron_maiden, 1)
	])
	
	//16
	spawner.addPhase([
		setup_spawn(obj_bugbear, 6)
	])
	
	//17
	spawner.addPhase([
		setup_spawn(obj_cyclo_skeleton, 8),
		setup_spawn(obj_reaper, 3)
	])
	
	//18
	spawner.addPhase([
		setup_spawn(obj_cyclo_skeleton, 8),
	])
}
