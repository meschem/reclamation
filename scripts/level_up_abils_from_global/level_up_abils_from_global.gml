// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function level_up_abils_from_global() {
	if (array_length(global.treeStore) > 0)  {
		for (var i = 0; i < array_length(global.treeStore); i++) {
			global.treeStore[i].retrieve()
		}
	}
}