/// @description Vars

age = 0
spawnAge = 0

enemyTypes = [
	obj_skeleton
]

active = false

enum spawnBehaviors {
	cycle,
	rand,
	swarm,
	elite,
	boss
}

enum enumSpawnFlags {
	chargeOpposite,
	chargeTarget,
	noTarget,
	clusterSpawn
}

enum enumSides {
	top, bottom, left, right
}

spawnSelectionType = spawnBehaviors.cycle
spawnStartFrame = 0
spawnEndFrame = 1800
spawnPeriod = 60
spawnCount = 20
spawnIndex = 0
singleSpawn = false
eliteSpawn = false
bossSpawn = false
spawnType = spawnerTypes.standard

//clusterSpawnProcessed = false
//clusterSpawnFactor = 10

spawnFlags = []

lastRandomX = -1
lastRandomY = -1

///@description								Adds an enemy
///@param {asset.GMObject} enemyType		Type of enemy
///@param {real} rarity						Rarity of enemy. Default is 1.
addEnemyType = function (enemyType, rarity = 1) {
	enemyTypes[array_length(enemyTypes)] = enemyType
}
