enum weaponUpgradeBarStates {
	spawning,
	growing,
	set
}

age = 0

enabled = false
weapon = noone
menu = noone
state = weaponUpgradeBarStates.spawning

nodes = []

level = 0

fillCur = 0
fillGoal = 0
fillBackScale = 0

nodeSpacing = 19

enable = function() {
	if (level == 0) {
		show_error("level for wupg bar is 0, should be >= 1", false)
		level++
	}
	
	var _barLength = 0
	
	enabled = true
	
	state = weaponUpgradeBarStates.growing
	
	//fillCur = (level - 1) * nodeSpacing
	//fillGoal = level * nodeSpacing
	//fillBackScale = nodeSpacing * array_length(nodes)

	depth = menu.depth - 10

	x = menu.x + 56
	y = menu.y + 32
	
	for (var i = 0; i < array_length(nodes); i++) {
		if (level - 1 == i) {
			fillCur = _barLength
		} else if (level == i) {
			fillGoal = _barLength
		}

		_barLength += nodeSpacing + nodes[i].sprite_width
		
		nodes[i].depth = depth - 10
		
		nodes[i].y = y
		nodes[i].x = x + _barLength - (floor(nodes[i].sprite_width / 2))
		
		fillBackScale += (nodes[i].sprite_width - 2) + nodeSpacing
	}
	
	
}
