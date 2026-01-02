///@description                         Currently is not manageable. But will be!
///@param {real} _profileSetting        Uses enum enumProfileSettings
///@return {any}
function get_profile_settings(_profileSetting) {
    var _profile = noone
    
    with (obj_profile_controller) {
        _profile = selectedProfile
    }
    
    if (_profile == noone) {
        show_error("Profile info requested with no profile controller extant", true)
    }
    
	switch (_profileSetting) {
        case enumProfileSettings.oreVeinCount:
            return _profile.oreVeinCount
            
        case enumProfileSettings.unlockedMapSections:
            return _profile.unlockedMapSections
    }
}