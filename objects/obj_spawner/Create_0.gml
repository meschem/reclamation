/// @description Vars

age = 0

enemyTypes = [
	obj_skeleton
]

enum spawnBehaviors {
	cycle,
	rand
}

spawnSelectionType = spawnBehaviors.cycle
spawnStartFrame = 0
spawnEndFrame = 3600
spawnPeriod = 60
spawnCount = 20
spawnIndex = 0

lastRandomX = -1
lastRandomY = -1

add_enemy_type = function (enemyType) {
	enemyTypes[array_length(enemyTypes)] = enemyType
}
