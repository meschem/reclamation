///@description						Activates character stat bonuses on items
function process_ability_char_stat_bonuses() {
	with (obj_ability) {
		for (var i = 0; i < array_length(charStatBonuses); i++) {
			if (charStatBonuses[i].stat == enumCharStats.str) {
				charStatBonuses[i].active = (owner.baseStr + owner.bonusStr > charStatBonuses[i].amount)
			} else if (charStatBonuses[i].stat == enumCharStats.dex) {
				charStatBonuses[i].active = (owner.baseDex + owner.bonusDex > charStatBonuses[i].amount)
			} else if (charStatBonuses[i].stat == enumCharStats.int) {
				charStatBonuses[i].active = (owner.baseInt + owner.bonusInt > charStatBonuses[i].amount)
			}
		}
	}
}
