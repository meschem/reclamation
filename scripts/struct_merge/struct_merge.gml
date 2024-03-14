///@description					Merges two structs goether
///@param {struct} primary		Primary struct
///@param {struct} secondary	Secondary struct. Overwrites properties in primary.
///@param {bool} shared			If true, only overwrites shared properties and ignores new ones.
function struct_merge(primary, secondary, shared = false) {
	var _ReturnStruct = primary;
	
	if (shared)	{
		var _PropertyNames = variable_struct_get_names(primary);
		
		for (var i = 0; i < array_length(_PropertyNames); i ++)	{
			if (variable_struct_exists(secondary, _PropertyNames[i]))	{
				variable_struct_set(_ReturnStruct, _PropertyNames[i], variable_struct_get(secondary, _PropertyNames[i]));
			}
		}
	} else {
		var _PropertyNames = variable_struct_get_names(secondary);
		
		for (var i = 0; i < array_length(_PropertyNames); i ++)	{
			variable_struct_set(_ReturnStruct, _PropertyNames[i], variable_struct_get(secondary, _PropertyNames[i]));
		}
	}
	return _ReturnStruct;
}