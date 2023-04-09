///@description				 Adds a talent to the player
///@param {real} talentIndex index for obj_game_controller.talents[]

function add_talent(talentIndex) {
	with (obj_game_controller) {
		talents[talentIndex][talentProps.curLevel]++
		
		var curLevel = talents[talentIndex][talentProps.curLevel]
		
		
		switch (talentIndex) {
			case talentList.stormAura:
				if (curLevel == 1) {
					instance_create_depth(0, 0, depths.playerAura, obj_aura_storm_aura)
				}
			break
			
			case talentList.healthUp:
				obj_player.maxHp += 25
				obj_player.hp += 25
			break
			
			case talentList.moveSpeedUp:
				obj_player.moveSpeedMax += 0.15
			break
			
			case talentList.warStomp:
				add_ability(playerAbilities.warStomp)
			break
			
			case talentList.charge:
				add_ability(playerAbilities.charge)
			break
		}
	}
}