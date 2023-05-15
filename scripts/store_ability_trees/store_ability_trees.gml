// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function store_ability_trees() {
	for (var i = 0; i < array_length(obj_game_controller.abilityTrees); i++) {
		var abilTree = obj_game_controller.abilityTrees[i]
		global.treeStore[i] = new abilityTreeStore(abilTree.object_index)
		
		global.treeStore[i].store()
	}
}