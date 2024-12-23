///@description		Init

enum enumRunStats {
	kills,
	goldGained,
	oreGained,
	xpGained,
	runesGained,
}

owner = noone

statsKills = {}
statsKillsTotal = 0
statsGoldGained = 0
statsOreGained = 0
statsXpGained = 0
statsRunesGained = 0

damageStats = []
///@description				Gets the NAME of a stat to base used for score screen
///@param {real} _stat		Stat to get. Uses enum enumRunStats
///@return {string}
getRunStatStringName = function(_stat) {
	switch (_stat) {
		case enumRunStats.kills:
			return "Kills"
			
		case enumRunStats.goldGained:
			return "Gold"
			
		case enumRunStats.oreGained:
			return "Ore"
			
		case enumRunStats.xpGained:
			return "Experience"
			
		case enumRunStats.runesGained:
			return "Runes"
	}
}

///@description				Gets the AMOUNT of a stat to base used for score screen
///@param {real} _stat		Stat to get. Uses enum enumRunStats
///@return {string}
getRunStatStringAmount = function(_stat) {
		switch (_stat) {
		case enumRunStats.kills:
			return statsKillsTotal
			
		case enumRunStats.goldGained:
			return statsGoldGained
			
		case enumRunStats.oreGained:
			return statsOreGained
			
		case enumRunStats.xpGained:
			return statsXpGained
			
		case enumRunStats.runesGained:
			return statsRunesGained
	}
}
