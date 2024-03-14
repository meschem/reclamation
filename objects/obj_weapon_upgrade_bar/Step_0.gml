/// @description Insert description here
// You can write your code in this editor

if (!instance_exists(menu)) {
	for (var i = 0; i < array_length(nodes); i++) {
		instance_destroy(nodes[i])
	}
	
	instance_destroy()
}

if (state == weaponUpgradeBarStates.growing) {
	age++
	
	if (age % 2 == 0) {
		fillCur++
	}
	
	if (fillCur >= fillGoal) {
		state = weaponUpgradeBarStates.set
		
		nodes[level - 1].state = weaponUpgradeBarNodeStates.highlighted
	} 
} else if (state == weaponUpgradeBarStates.set) {
	
}
