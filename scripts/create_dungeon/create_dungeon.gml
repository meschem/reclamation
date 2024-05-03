///@description						Creates a dungeon
///@param {real} _dungeonBiomeEnum	Biome for dungeon type. Uses enum dungeonBiomes
///@param {real} _totalRooms		Amount of rooms to use. Standard is 5
///@param {real} _difficulty		Difficulty level. Driven by meta character level
///@return {id.Instance}

function create_dungeon(_dungeonBiomeEnum, _totalRooms = 5, _difficulty = 1) {
	var _dungeon = create_instance(obj_dungeon)
	
	_dungeon.biome = _dungeonBiomeEnum
	_dungeon.baseDifficulty = _difficulty
	_dungeon.totalRooms = _totalRooms
	
	_dungeon.build()
	
	create_toaster("Dungeon Built")
	
	return _dungeon
}
