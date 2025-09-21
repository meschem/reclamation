//nextLevel = rm_combat_testing_b

//setup_level_busy()

//spawner.addPhase([
//	spawner.setupFlybySpawn(obj_devil, false, 3),
//])

//cameraOffset.y = -3

bossName = "Hydra Lord"
bossTitle = "Serpent of the Deep"
bossSprite = spr_hydra_red

set_spawner_phase_length(10)

setup_spawner_endless(obj_skeleton, 0, 2, 4)
//setup_spawner_endless(obj_skeleton_warrior, 1, 1, 4)

category = roomCategories.boss
reward = roomRewards.gold
