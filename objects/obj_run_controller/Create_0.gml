///@description	Init

enum runTypes {
	normal,
	custom
}

enum baddieScalars {
	hp,
	moveSpeed,
	spawnCount
}

create_instance(obj_equipment_controller)

type = runTypes.normal

dungeon = noone
currentFloor = 0
currentRoom = -1

displayRunInfo = true
displayStateSpacing = 10

// Difficulty Scalars
enemyScalingHp = 1
enemyScalingMoveSpeed = 1
enemyScalingSpawnCount = 1

enemyScalingSpawnCountTable = [
	0.4,
	0.7,
	1,
	1.4,
	2,
	

	2.2,
	2.4,
	2.6,
	2.8,
	3
]

enemyScalingCdMax = seconds_to_frames(60)
enemyScalingCdCur = enemyScalingCdMax
enemyScalesWithTime = false

enemyScalingHpIncrease = 0.1
enemyScalingMoveSpeedIncrease = 0.1

challengeLevel = 1

resetRun = function() {
	enemyScalingHp = 1
	enemyScalingMoveSpeed = 1
}

///@description									Loads a specific dungeon room
///@param {struct.dungeonRoom} _dungeonRoom		Room to load
loadRoom = function(_dungeonRoom) {
	currentRoom = _dungeonRoom
	room_goto(_dungeonRoom.roomId)
}

///@description				Gets a scaling stat
///@param {real} _stat		Stat type to retrieve		
getBaddieScaling = function(_stat) {
	switch (_stat) {
		case baddieScalars.hp:
			return (currentFloor * 0.1) + 1
		
		case baddieScalars.moveSpeed:
			return enemyScalingMoveSpeed
		
		case baddieScalars.spawnCount:
			if (currentFloor >= array_length(enemyScalingSpawnCountTable)) {
				return array_last(enemyScalingSpawnCountTable)
			}
			
			return enemyScalingSpawnCountTable[currentFloor]
	}
}
