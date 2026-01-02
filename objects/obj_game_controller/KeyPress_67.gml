
//instance_create_depth(mouse_x, mouse_y, depths.enemy, obj_coin_stack)

//with (obj_player) {
//	baseStr = 100
//	baseDex = 100
//	baseInt = 100
//}

//process_player_stats()

//create_toaster("Stats set to 100")
//create_lob_drop_with_table(mouse_x, mouse_y, enumDropType.baddieFieldBoss)

//with (obj_dest_tree_green) {
    //instance_destroy()
//}

for (var i = 0; i < 1000; i++) {
    instance_create_depth(100, 100, depths.enemy, obj_dest_bush)
}

//obj_debug_controller.checkType = debugCheckTypes.struct
//obj_debug_controller.structInfo = obj_run_stats_controller.damageStats

//show_message(obj_run_stats_controller.damageStats)

//var _rolls = []
//var _roll = 0

//var _n = 0
//var _m = 0
//var _r = 0
//var _l = 0

//for (var i = 0; i < 100; i++) {
//	_roll = get_random_rarity(500)
	
//	switch (_roll) {
//		case enumRarity.normal: _n++; break;
//		case enumRarity.magic: _m++; break;
//		case enumRarity.rare: _r++; break;
//		case enumRarity.legendary: _l++; break;
//	}
//}

//show_message([
//	_n, _m, _r, _l
//])

//show_message(obj_player.abilities)