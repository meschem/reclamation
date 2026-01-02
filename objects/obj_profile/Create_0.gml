/// @description Init

name = "Matt"

oreVeinCount = 4

// list of map section enums
unlockedMapSections = [
    
]


heroSaves = [
	
]



///@description					Data to store for a character in a save
///param {real} _character		Uses enum heroes
function heroSave(_character = heroes.jonah, _unlocked = false) constructor {
	character = _character
	unlocked = _unlocked
}
