///@description   Description
function setup_level_single_area_a() {
	//1
	spawner.addPhase([
		setup_spawn(obj_skeleton, 4)
	])
	
	//2
	spawner.addPhase([
		setup_spawn(obj_skeleton, 4),
		setup_spawn(obj_skeleton_warrior, 2),
	])

	//3
	spawner.addPhase([
		setup_spawn(obj_skeleton, 4),
		setup_spawn(obj_skeleton_warrior, 2)
	])
	
	//4
	spawner.addPhase([
		setup_spawn(obj_skeleton, 6),
		setup_spawn_unique(obj_u_rattlebones),
	])
	
	//5
	spawner.addPhase([
		setup_spawn(obj_boarrior, 2),
	])
	
	//6
	spawner.addPhase([
        setup_spawn(obj_skeleton, 2),
		setup_spawn(obj_boarrior, 3)
	])
	
	//7
	spawner.addPhase([
		setup_spawn(obj_zombie, 6)
	])
	
	//8
	spawner.addPhase([
		setup_spawn(obj_zombie, 2),
		setup_spawn(obj_devil, 8, spawnWvs, spawnerTypes.flybyChargeCluster)
	])
	
	//7
	spawner.addPhase([
        setup_spawn_elite(obj_zombie_elite),
		setup_spawn(obj_zombie, 2)
	])
	
	//8
	spawner.addPhase([
		setup_spawn(obj_zombie, 4)
	])
	
	//9
	spawner.addPhase([
		setup_spawn(obj_slime_green, 6, 16)
	])
	
	//10
	spawner.addPhase([
		setup_spawn(obj_slime_green, 12, 16)
	])
	
	//11
	spawner.addPhase([
		setup_spawn(obj_wraith, 2),
		setup_spawn(obj_zombie_huge, 2)
	])
	
	//12
	spawner.addPhase([
		setup_spawn(obj_skeleton_warrior, 2),
		setup_spawn(obj_skeleton_champion, 1),
        setup_spawn_unique(obj_u_abaddon)
	])
	
	//13
	spawner.addPhase([
		setup_spawn(obj_skeleton_champion, 1, 1, spawnerTypes.elite),
		setup_spawn(obj_poison_skeleton, 6)
	])
	
	//14
	spawner.addPhase([
		setup_spawn(obj_skull_head_frozen, 3),
		setup_spawn(obj_skeleton_warrior, 3),
	])
	
	//14
	spawner.addPhase([
		setup_spawn(obj_skull_head_frozen, 4),
		setup_spawn(obj_skeleton_warrior, 4),
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
    
    //show_message("DROP BOSS")

}
