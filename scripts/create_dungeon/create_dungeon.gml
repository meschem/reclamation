///@description							Creates a dungeon
///@param {real} _dungeonBiomeEnum		Biome for dungeon type. Uses enum dungeonBiomes
///@param {real} _totalRooms			Amount of rooms to use. Standard is 5
///@param {real} _difficulty			Difficulty level. Driven by meta character level
///@param [real} _difficultyIncrement	Difficulty increment per level
///@return {id.Instance}

function create_dungeon(_dungeonBiomeEnum, _totalRooms = 8, _difficulty = 1, _difficultyIncrement) {
	var _dungeon = create_instance(obj_dungeon)
	
	_dungeon.biome = _dungeonBiomeEnum
	_dungeon.baseDifficulty = _difficulty
	_dungeon.difficultyIncrement = _difficultyIncrement
	_dungeon.totalRooms = _totalRooms
	
	_dungeon.build()
	
	create_toaster("Dungeon Built")
	
	return _dungeon
}
