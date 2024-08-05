///@description				Processes the room reward from the dungeon room
///@param {real} _reward	Uses enum roomRewards
function process_room_reward(_reward) {
	overtimeLength = seconds_to_frames(5)
	
	var _player = get_first_player()
	
	switch (_reward) {
		case roomRewards.trinket:
			display_level_trinket_prompt(_player)
		break
		
		case roomRewards.abilityLevel:
			display_level_abil_lvlup_prompt(_player)
		break
		
		case roomRewards.fullHeal:
			with (obj_player) {
				applyHeal(maxHp)
			}
		break
		
		case roomRewards.gold:
			var _loops = 6 + (get_current_difficulty_level() * 2)
			var _amount = 1
			var _x, _y, _inst
			
			overtimeLength = seconds_to_frames(12)
			
			for (var i = 0; i < _loops; i++) {
				_amount = irandom_range(3, 6)
				_x = obj_player_spawn.x + irandom_range(-60, 60)
				_y = obj_player_spawn.y + irandom_range(-60, 60)
				_inst = instance_create_depth(_x, _y, depths.enemy, obj_coin)
				_inst.pickupValue = _amount
				
				_amount = irandom_range(15, 20)
				_x = obj_player_spawn.x + irandom_range(-45, 45)
				_y = obj_player_spawn.y + irandom_range(-45, 45)
				_inst = instance_create_depth(_x, _y, depths.enemy, obj_coin_stack)
				_inst.pickupValue = _amount
			}
		break
		
		case roomRewards.metaMoney:
			create_toaster("You got meta money! (Not Really)")
		break
		
		case roomRewards.trinketRare:
			create_toaster("Rare trinket drop not setup yet")
			display_level_trinket_prompt(_player)
		break
		
		case roomRewards.weaponUpgrade:
			display_weapon_upgrade_prompt(_player)
		break
	}
}
