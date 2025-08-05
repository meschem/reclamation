///@Description Init

// list of obj_projectile objects
profiles = []

selectedProfile = noone
latestProfile = noone

///@description		Spawns profile objects
loadTempProfiles = function() {
	var _profile = noone
	
	_profile = create_instance(obj_profile)
	_profile.name = "CreamyT"
	array_push(_profile.heroSaves, heroes.jonah)
	array_push(_profile.heroSaves, heroes.ophelia)
	array_push(_profile.unlockedMapSections, mapSections.plainsEast)
	array_push(_profile.unlockedMapSections, mapSections.plainsWest)
	array_push(_profile.unlockedMapSections, mapSections.mountains)
	array_push(_profile.unlockedMapSections, mapSections.islandEast)
	array_push(_profile.unlockedMapSections, mapSections.islandSouth)
	array_push(_profile.unlockedMapSections, mapSections.islandSouthEast)
	array_push(profiles, _profile)
	
	_profile = create_instance(obj_profile)
	_profile.name = "Sam"
	array_push(_profile.heroSaves, heroes.jonah)
	array_push(_profile.unlockedMapSections, mapSections.plainsEast)
	array_push(_profile.unlockedMapSections, mapSections.plainsWest)
	array_push(profiles, _profile)
	
	_profile = create_instance(obj_profile)
	_profile.name = "Hayden"
	array_push(_profile.heroSaves, heroes.jonah)
	array_push(_profile.heroSaves, heroes.ophelia)
	array_push(_profile.unlockedMapSections, mapSections.plainsEast)
	array_push(_profile.unlockedMapSections, mapSections.mountains)
	array_push(_profile.unlockedMapSections, mapSections.islandSouthEast)
	array_push(profiles, _profile)
	
	latestProfile = profiles[2]
}

loadTempProfiles()
