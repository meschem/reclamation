///@description							Creates a dungeon biome instance based on type
///@param {real} _dungeonBiomeEnum		Type of biome to create. Uses ENUM dungeonBiomes.
function create_biome(_dungeonBiomeEnum) {
	var _inst = noone
	
	switch (_dungeonBiomeEnum) {
		case dungeonBiomes.castle:
			_inst = create_instance(obj_dungeon_biome_castle)
		break
			
		default:
			show_error("Bad dungeon biome type. Use _dungeonBiomeEnum", true)
		break
	}
	
	return _inst
}