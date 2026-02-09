//nextLevel = rm_combat_testing_b

//setup_level_busy()

//spawner.addPhase([
//	spawner.setupFlybySpawn(obj_devil, false, 3),
//])

//cameraOffset.y = -3

bossName = "Yoklir"
bossTitle = "Frost-Cursed Lich of the North"
bossSprite = spr_lich_yoklir

set_spawner_phase_length(10)

setup_spawner_endless(obj_skeleton, 0, 2, 4)
//setup_spawner_endless(obj_skeleton_warrior, 1, 1, 4)

category = roomCategories.boss
reward = roomRewards.gold
