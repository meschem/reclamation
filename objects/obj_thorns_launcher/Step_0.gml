
if (game_is_paused()) {
    return 0
}

cd++

if (cd >= cdMax) {
    cd = 0
    
    if (caster == noone || ability == noone) {
        create_toaster("Caster or Ability not set on thorns caster")
        
        return 0
    }
    
    activate_spiked_armor(caster, ability)
    
    shotsCur++
    
    if (shotsCur >= shotsTotal) {
        instance_destroy()
    }
}
