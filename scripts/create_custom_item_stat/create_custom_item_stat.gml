///@description                     Creates a custom item stat
///@param {any} _values             Can be a single or array of values
///@param {string} _displayName     Name as it should be displayed
///@param {real} _unitEnum          Uses enum statUnits
function create_custom_item_stat(_values, _displayName, _unitEnum = statUnits.none) {
    var _stat = new itemStat(
        enumItemStats.custom,
        _values,
        true,
        {
            displayName: _displayName,
            unitEnum: _unitEnum
        }
    )
    
    return _stat
}


