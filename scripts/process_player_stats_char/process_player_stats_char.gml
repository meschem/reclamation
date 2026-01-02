// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function process_player_stats_char(){
	var i, trinketLevel
	var rollingStr = 0
	var rollingDex = 0
	var rollingInt = 0

	with (obj_player) {
		var player = id
		// Process Trinkets
		
		/** Does not process Trinkets atm  **/
		
		//for (i = 0; i < array_length(trinkets); i++) {
		//	trinketLevel = trinkets[i].level

		//	if (array_length(trinkets[i].bonusStr) > trinketLevel - 1) {
		//		rollingScalar += trinkets[i].bonusStr[trinketLevel - 1]
		//	}
		//}
		
		// Process Items
		with (obj_equipment) {
			if (owner == player && equipped && slot != equipmentSlots.trinket) {
				if (is_array(bonusStr)) {
					rollingStr += bonusStr[level - 1]
                } else {
                    rollingStr += bonusStr
                }
                
                if (is_array(bonusDex)) {
					rollingDex += bonusDex[level - 1]
                } else {
                    rollingDex += bonusDex
                }
                
                if (is_array(bonusInt)) {
					rollingInt += bonusInt[level - 1]
                } else {
                    rollingInt += bonusInt
                }
			}
		}
		
		with (obj_weapon_upgrade) {
			if (active) {
				//rollingScalar += bonusDamageScalar
			}
		}
		
		// Process Talents
		
		// Process Items
		
		bonusStr = rollingStr
		bonusDex = rollingDex
		bonusInt = rollingInt
		
		show_debug_message($"Stat Bonuses: Str: +{rollingStr}, Dex: +{rollingDex}, Int: +{rollingInt}")
	}
}