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

selectedMapSection = -1

mapObjects = [
	obj_map_location_plains_east,
	obj_map_location_plains_west,
	obj_map_location_island_east,
	obj_map_location_island_southeast,
	obj_map_location_island_south,
	obj_map_location_mountains
]

mapSectionList = []

var _inst = noone

for (var i = 0; i < array_length(mapObjects); i++) {
	_inst = create_instance(mapObjects[i])
	array_push(mapSectionList, _inst)
}

///@description					Gets a map object from its enum
///@param {real} _sectionEnum	mapSection enum
///@return {id.Instance}
getMapObjectFromEnum = function(_sectionEnum) {
	for (var i = 0; i < array_length(mapSectionList); i++) {
		if (_sectionEnum == mapSectionList[i].mapSectionEnum) {
			return mapSectionList[i]
		}
	}
	
	show_error("Map section enum not found: " + str(_mapSectionEnum), true)
}

///@description				Unlocks a section of the map	
///@param {real} _section	mapSection enum to unlock
unlockMapSection = function(_section) {
	for (var i = 0; i < array_length(mapSectionList); i++) {
		if (mapSectionList[i].mapSectionEnum == _section) {
			mapSectionList[i].unlocked = true
		}
	}
}

///@description				Removes the map covers for unhidden sections
hideUnlockedMapSections = function() {
	var _profile = obj_profile_controller.selectedProfile
	
	for (var i = 0; i < array_length(mapSectionList); i++) {
		mapSectionList[i].mapCoverSection.visible = !mapSectionList[i].unlocked
	}
}

///@description					Gets a map section
///@param {real} _mapSection	Uses mapSections enum
///@return {id.Instance}
getMapSection = function(_mapSection) {
	for (var i = 0; i < array_length(mapSectionList); i++) {
		if (mapSectionList[i].mapSectionEnum == _mapSection) {
			return mapSectionList[i]
		}
	}
	
	throw ("Invalid mapSection enum")
}

///@description Creates the buttons for the map
createMapButtons = function() {
	var _menu = create_instance(obj_map_menu)
	var _button = noone
	
	_menu.centered = false
	_menu.centeredY = true
	_menu.centeredX = false	

	for (var i = 0; i < array_length(mapSectionList); i++) {
		_button = instance_create_depth(-999, -999, depths.ui, obj_menu_button_map_section)
		_button.displayText = mapSectionList[i].name
		_button.display = true
		_button.menu = _menu
		_button.destination = mapSectionList[i].mapRoom
		_button.mapSection = mapSectionList[i]
		_button.enabled = mapSectionList[i].unlocked
		
		array_push(_menu.buttons, _button)		
	}
	
	_menu.display = true
}

var _unlockedSections = obj_profile_controller.selectedProfile.unlockedMapSections

//show_message(_unlockedSections)

for (var i = 0; i < array_length(_unlockedSections); i++) {
	unlockMapSection(_unlockedSections[i])
}

hideUnlockedMapSections()
createMapButtons()
