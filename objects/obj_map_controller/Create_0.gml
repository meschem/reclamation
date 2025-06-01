///@description	Init

/*
	Manages map access
	
	* All locations should be handled in an enum list
	* ARC operations done via scripts
*/

enum mapSections {
	plainsWest,
	plainsEast,
	islandEast,
	islandSouthEast,
	islandSouth,
	mountains
}

///@description	Map section
///@param {string} _name
///@param {asset.GMObject} _obj
///@param {real} _enum
///@param {bool} _unlocked
function mapSection(_name, _obj, _enum, _unlocked = false) constructor {
	name = _name
	mapCoverSection = _mapCoverSection
	mapSectionEnum = _enum
	
	unlocked = _unlocked
}

mapSectionList = [
	new mapSection("Eastern Plains", obj_world_map_cover_plains_east, mapSections.plainsEast, true),
	new mapSection("Western Plains", obj_world_map_cover_plains_west, mapSections.plainsWest),	
	new mapSection("Verdant Island", obj_world_map_cover_island_east, mapSections.islandEast),
	new mapSection("Desert Island", obj_world_map_cover_island_southeast, mapSections.islandSouthEast),
	new mapSection("Dead Island", obj_world_map_cover_island_south, mapSections.islandSouth),
	new mapSection("Iron Mountains", obj_world_map_cover_mountains, mapSections.mountains),
]

unlockMapSection = function(_section) {
	for (var i = 0; i < array_length(mapSectionList); i++) {
		if (mapSectionList[i].mapSectionEnum == _section) {
			mapSectionList[i].unlocked = true
		}
	}
}

hideUnlockedMapSections = function() {
	for (var i = 0; i < array_length(mapSectionList); i++) {
		mapSectionList[i].mapCoverSection.visible = !mapSectionList[i].unlocked
	}
}