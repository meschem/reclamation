age++

switch (state) {
	case weaponUpgradeBarNodeStates.inactive:
		image_index = 0
	break	

	case weaponUpgradeBarNodeStates.highlighted:
		image_index = 1
		
		if (random(1) < randomCap) {
			var xPosOffset, yPosOffset, inst, sprite
			var spriteHalfWidth = sprite_width / 2
		
			xPosOffset = floor(random(spriteHalfWidth))
			yPosOffset = spriteHalfWidth - xPosOffset 
			
			sprite = array_random(flameSprites)
		
			inst = instance_create_depth(x - xPosOffset, y - yPosOffset + 1, depth + 5, obj_particle_single_cycle_gui)
			inst.sprite_index = sprite
		
			xPosOffset = floor(random(spriteHalfWidth))
			yPosOffset = spriteHalfWidth - xPosOffset
		
			inst = instance_create_depth(x + xPosOffset, y - yPosOffset + 1, depth + 5, obj_particle_single_cycle_gui)
			inst.sprite_index = sprite
		}
	break
	
	case weaponUpgradeBarNodeStates.active:
		image_index = 2
	break
}
