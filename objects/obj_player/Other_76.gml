if event_data[? "event_type"] == "sprite event" // or you can check "sprite event"
{
    switch (event_data[? "message"])
    {
        case "activateWarStomp":
			var ownerId = id
			
			with (obj_ability_war_stomp_active) {
				if (ownerId == owner) {
					activate_war_stomp_active(level)	
				}
			}
        break
    }
}