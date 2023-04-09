///@description   Description

function push_baddies_away() {
	var enemies = ds_list_create()
	var count = collision_circle_list(x, y, pushRadius, obj_baddie, false, true, enemies, false)
	
	if (count > 0) {
		for (var i = 0; i < count; ++i;)
	    {
			var enemy = enemies[| i]
			
			enemy.x += sign(enemy.x - x)
			enemy.y += sign(enemy.y - y)
	    }
	}
	
	ds_list_destroy(enemies)
}
