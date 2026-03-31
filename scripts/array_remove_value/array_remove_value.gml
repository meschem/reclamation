/// @desc                       Removes a value from an array
/// @param {Array} _array       The array to modify
/// @param {Any} _value         The value to search for and remove
/// @param {Bool} _all          If true, removes all occurrences. If false, only the first.
function array_remove_value(_array, _value, _all = true) {
    if (_all) {
        for (var i = array_length(_array) - 1; i >= 0; i--) {
            if (_array[i] == _value) {
                array_delete(_array, i, 1);
            }
        }
    } else {
        var _index = array_get_index(_array, _value);
        if (_index != -1) {
            array_delete(_array, _index, 1);
        }
    }
}
